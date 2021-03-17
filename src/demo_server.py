#!/home/ou/software/anaconda3/envs/dl/bin/python

import rospy
import ros_numpy as rnp
from ros_yolo.srv import *
from ros_yolo.msg import *

import torch
import numpy as np

import sys
import os

sys.path.append(rospy.get_param('yolov5_path'))

import utils
import utils.general
import models
import models.experimental


class Ros2Yolo:
    def __init__(self, node_name='demo_server', service_name='yolo_service'):
        # load param
        self.yolo5_path = rospy.get_param('yolov5_path', None)
        self.model = rospy.get_param('yolov5_model', 'yolov5s')
        self.weight = rospy.get_param('yolov5_weight', None)
        self.device = rospy.get_param('device', 'gpu')
        self.img_size = rospy.get_param('img_size', 640)
        self.valid = False if self.yolo5_path is None and self.weight is None else True

        self.stride = 32
        self.half = True if self.device == 'gpu' else False
        self.names = []

        rospy.init_node(node_name)
        self.server = rospy.Service(service_name, yolo, self.request_handle)

    def load_model(self):
        # load model
        if not self.valid:
            return False

        self.device = torch.device('cuda:0' if (self.device != 'cpu' and torch.cuda.is_available()) else 'cpu')
        # _model = t.hub.load('ultralytics/yolov5', 'custom', path_or_model=weight)
        # _model.cuda()
        self.model = models.experimental.attempt_load(self.weight, self.device)
        self.stride = int(self.model.stride.max())
        self.img_size = utils.general.check_img_size(self.img_size, s=self.stride)
        self.half = self.device.type != 'cpu'
        if self.half:
            self.model.half()
        self.names = self.model.module.names if hasattr(self.model, 'module') else self.model.names
        print('labels: '), self.print_list_multiline(self.names)
        return True

    def request_handle(self, req):
        img0 = rnp.numpify(req.image)

        if len(img0) == 0:
            return yoloResponse()

        img = utils.datasets.letterbox(img0, self.img_size, stride=self.stride)[0].transpose(2, 0, 1)  # (3,w,h)
        img = np.ascontiguousarray(img)  # (1,3,w,h)
        img = torch.from_numpy(img)
        if img.ndimension() == 3:
            img = img.unsqueeze(0)

        img = img.to(self.device)
        img = img.half()
        img /= 255.0
        with torch.no_grad():
            t1 = utils.torch_utils.time_synchronized()
            pred = self.model(img)[0]
            # list of detections, on (n,6) tensor per image [xyxy, conf, cls]
            pred = utils.general.non_max_suppression(pred, 0.25, 0.45)
            t2 = utils.torch_utils.time_synchronized()

        response = yoloResponse()
        for i, det in enumerate(pred):
            s = ''
            if len(det):
                # Rescale boxes from img_size to im0 size
                det[:, :4] = utils.general.scale_coords(img.shape[2:], det[:, :4], img0.shape).round()

                # Print results
                for c in det[:, -1].unique():
                    n = (det[:, -1] == c).sum()  # detections per class
                    s += f"{n} {self.names[int(c)]}{'s' * (n > 1)}, "  # add to string

                # Write results
                for *xyxy, conf, cls in reversed(det):
                    res = result()
                    res.label = f'{self.names[int(cls)]} {conf:.2f}'
                    res.id = int(cls)
                    res.prob = conf
                    res.bbox.xyxy = xyxy
                    response.results.append(res)

        print(pred)
        print((t2 - t1) * 1000)
        return response

    @staticmethod
    def print_list_multiline(names, num_line=5):
        length = len(names)
        print('[', end="")
        for i in range(0, length):
            print('\'', end=''), print(names[i], end=''), print('\'', end='')
            if i == length - 1:
                print(']')
            elif i % num_line == num_line - 1:
                print(',\n ', end='')
            else:
                print(',', end=' ')


if __name__ == "__main__":
    yoloBridge = Ros2Yolo()
    if not yoloBridge.load_model():
        print('param error!')
    rospy.spin()
