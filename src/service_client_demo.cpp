//
// Created by ou on 2021/3/14.
//
#include <ros/ros.h>
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <ros_yolo/yolo.h>
#include <actionlib/client/simple_action_client.h>
#include <ros_yolo/yoloAction.h>
#include <boost/thread.hpp>

using namespace std;


int main(int argc, char **argv) {
    ros::init(argc, argv, "client_node");
    ros::NodeHandle n;

    cv::VideoCapture capture;
    capture.open("/home/ou/Desktop/video1.mp4");
    cv::Mat frame;
    bool isAction = false;
    n.getParam("yolov5/action", isAction);
    if (isAction) {
        ROS_ERROR("no in service mode, please modify the .yaml file and reload");
        return 0;
    }
    while (capture.isOpened()) {
        capture.read(frame);


        ros::ServiceClient client = n.serviceClient<ros_yolo::yolo>("yolo_service");
        client.waitForExistence(ros::Duration(30e-3));

        ros_yolo::yolo srv;
        srv.request.image = *cv_bridge::CvImage(std_msgs::Header(), "bgr8", frame).toImageMsg();
        if (client.call(srv)) {
            cout << "----------------" << endl;
            cout << "detect: " << srv.response.results.size() << " objects" << endl;
            for (auto &result:srv.response.results) {
                auto xyxy = result.bbox.xyxy;
                cv::Point p1(xyxy[0], xyxy[1]), p2(xyxy[2], xyxy[3]), wh = p2 - p1;
                auto thickness = cv::min(wh.x, wh.y);
                cv::rectangle(frame, p1, p2, cv::Scalar(255, 0, 0), thickness / 40 + 1);
                cv::putText(frame, result.label, p1, cv::FONT_HERSHEY_COMPLEX,
                            1, cv::Scalar(0, 0, 255),
                            1, 0);
                cout << result.label << endl;
            }
        }

        cv::imshow("img", frame);
        ros::spinOnce();
        cv::waitKey(1);
    }
    return 0;
}