#!/home/ou/software/anaconda3/envs/dl/bin/python
import rospy
from yolo_bridge.yolo_bridge import Ros2Yolo

if __name__ == "__main__":
    yoloBridge = Ros2Yolo()
    if not yoloBridge.load_model():
        print('error occurred while loading !')
    rospy.spin()
