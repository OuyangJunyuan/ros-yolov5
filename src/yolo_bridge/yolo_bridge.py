import rospy
import actionlib
import ros_numpy as rnp
from ros_yolo.srv import *
from ros_yolo.msg import *
from yolo_bridge.yolo_bridge_utils import *


class Ros2Yolo:
    def __init__(self, node_name='demo_server', name='yolo'):
        self.isaction = rospy.get_param('yolov5/action', False)
        # load param
        self.yolo5_path = rospy.get_param('yolov5/path', None)
        self.model = rospy.get_param('yolov5/model', 'yolov5s')
        self.weight = rospy.get_param('yolov5/weight', None)
        self.device = rospy.get_param('yolov5/device', 'gpu')
        self.img_size = rospy.get_param('yolov5/img_size', 640)
        self.valid = False if (self.yolo5_path is None) and (self.weight is None) else True

        self.stride = 32
        self.half = True if self.device == 'gpu' else False
        self.names = []

        if not self.load_model():
            print('error occurred while loading !')
        rospy.init_node(node_name)
        if self.isaction:
            self.server = actionlib.SimpleActionServer(name + '_action', ros_yolo.msg.yoloAction,
                                                       execute_cb=self.request_handle, auto_start=False)
            self.server.start()
            print('action mode :', name + '_action')

        else:
            self.server = rospy.Service(name + '_service', yolo, self.request_handle)
            print('service mode :', name + '_service')

    def load_model(self):
        if not self.valid:
            return False

        self.device = torch.device('cuda:0' if (self.device != 'cpu' and torch.cuda.is_available()) else 'cpu')
        if self.yolo5_path is None:
            self.model = torch.hub.load('ultralytics/yolov5', 'custom', path_or_model=self.weight)
            self.model = self.model.cuda() if self.device != 'cpu' else self.model
        else:
            self.model = attempt_load(self.weight, self.device, yolo_path=self.yolo5_path)
        self.stride = int(self.model.stride.max())
        self.img_size = check_img_size(self.img_size, s=self.stride)
        self.half = self.device.type != 'cpu'
        if self.half:
            self.model.half()
        self.names = self.model.module.names if hasattr(self.model, 'module') else self.model.names
        print('labels: '), self.print_list_multiline(self.names)
        return True

    def request_handle(self, req):
        print('----------------')
        img0 = rnp.numpify(req.image)

        if len(img0) == 0:
            print('req.image.size == 0')
            return yoloResult() if self.isaction else yoloResponse()

        t1 = time_synchronized()

        img = letterbox(img0, self.img_size, stride=self.stride)[0].transpose(2, 0, 1)  # (3,w,h)
        img = np.ascontiguousarray(img)  # (1,3,w,h)
        img = torch.from_numpy(img)
        if img.ndimension() == 3:
            img = img.unsqueeze(0)

        img = img.to(self.device).float()
        img = img.half() if self.half else img  # gpu才支持half()->float16
        img /= 255.0
        with torch.no_grad():
            pred = self.model(img)[0]
            # list of detections, on (n,6) tensor per image [xyxy, conf, cls]
            pred = non_max_suppression(pred, 0.25, 0.45)

        response = yoloResult() if self.isaction else yoloResponse()

        for i, det in enumerate(pred):
            s = ''
            if len(det):
                # Rescale boxes from img_size to im0 size
                det[:, :4] = scale_coords(img.shape[2:], det[:, :4], img0.shape).round()

                # Print results
                for c in det[:, -1].unique():
                    n = (det[:, -1] == c).sum()  # detections per class
                    s += f"{self.names[int(c)]}{'s' * (n > 1)}: {n}\n"  # add to string

                # Write results
                for *xyxy, conf, cls in reversed(det):
                    res = result()
                    res.label = f'{self.names[int(cls)]} {conf:.2f}'
                    res.id = int(cls)
                    res.prob = conf
                    res.bbox.xyxy = xyxy
                    response.results.append(res)
            print(s)
        # print(pred[0][:, -1].cpu().numpy().astype(np.int))

        t2 = time_synchronized()
        print('took {:.2f}'.format((t2 - t1) * 1000), 'ms')

        if self.isaction:
            response.image = req.image
            self.server.set_succeeded(response)
        else:
            return response

    @staticmethod
    def print_list_multiline(names, num_line=5):
        length = len(names)
        print('[', end="")
        for i in range(0, length):
            print(str(i) + ':' + '\'', end=''), print(names[i], end=''), print('\'', end='')
            if i == length - 1:
                print(']')
            elif i % num_line == num_line - 1:
                print(',\n ', end='')
            else:
                print(',', end=' ')
