#!/home/ou/software/anaconda3/envs/dl/bin/python


import rospy
import ros_numpy as rnp
import cv2
from sensor_msgs.msg import Image
from rospkg import RosPack
from ros_yolo.srv import *
from ros_yolo.msg import *

import torch as t
import numpy as np
import time
import math
import yaml
import os

fs = open(os.path.join(RosPack().get_path('ros_yolo'), 'config/config.yaml'), encoding="UTF-8")
datas = yaml.load(fs, Loader=yaml.FullLoader)  # 添加后就不警告了
sys.path.append(datas['yolov5_path'])

import utils
import utils.general
import models
import models.experimental

half = False
device = 0
stride = 0
names = []


class YOLOV5:
    def __init__(self):
        rospy.spin()


def handle(req):
    img0 = rnp.numpify(req.image)

    if len(img0) == 0:
        return yoloResponse()
    img = utils.datasets.letterbox(img0, 640, stride=stride)[0].transpose(2, 0, 1)
    img = np.ascontiguousarray(img)
    img = t.from_numpy(img)
    if img.ndimension() == 3:
        img = img.unsqueeze(0)

    img = img.to(device)
    img = img.half()
    img /= 255.0
    print(img.shape)
    t1 = utils.torch_utils.time_synchronized()
    pred = model(img)[0]

    # list of detections, on (n,6) tensor per image [xyxy, conf, cls]
    pred = utils.general.non_max_suppression(pred, 0.25, 0.45)
    t2 = utils.torch_utils.time_synchronized()
    # print(pred)
    print((t2 - t1) * 1000)

    response = yoloResponse()
    for i, det in enumerate(pred):
        s = ''
        if len(det):
            # Rescale boxes from img_size to im0 size
            det[:, :4] = utils.general.scale_coords(img.shape[2:], det[:, :4], img0.shape).round()

            # Print results
            for c in det[:, -1].unique():
                n = (det[:, -1] == c).sum()  # detections per class
                s += f"{n} {names[int(c)]}{'s' * (n > 1)}, "  # add to string

            # Write results
            for *xyxy, conf, cls in reversed(det):
                res = result()
                res.label = f'{names[int(cls)]} {conf:.2f}'
                res.id = int(cls)
                res.prob = conf
                res.bbox.xyxy = xyxy
                response.results.append(res)

    return response


def add_two_ints_server():
    rospy.init_node('demo_server')
    server = rospy.Service('yolo_srv', yolo, handle)
    rospy.spin()


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


def load_model(weight, device='gpu'):
    device = t.device('cuda:0' if (device != 'cpu' and t.cuda.is_available()) else 'cpu')
    # https://github.com/ultralytics/yolov5/issues/36
    # model = torch.hub.load('ultralytics/yolov5', 'custom', path_or_model='yolov5s_voc_best.pt')
    _model = models.experimental.attempt_load(weight, device)
    _stride = int(_model.stride.max())
    # imgsz = check_img_size(imgsz, s=stride)  # check img_size
    half = device.type != 'cpu'
    if half:
        _model.half()
    names = _model.module.names if hasattr(_model, 'module') else _model.names

    if device.type != 'cpu':
        _model(t.zeros(1, 3, 640, 640).to(device).type_as(next(_model.parameters())))

    print('labels: '), print_list_multiline(names)
    return _model, _stride, names


model, stride, names = load_model('/home/ou/workspace/ros_ws/dev_ws/src/ros_yolo/model/best.pt')

if __name__ == "__main__":
    add_two_ints_server()
