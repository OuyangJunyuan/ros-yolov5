//
// Created by ou on 2021/3/14.
//
#include <ros/ros.h>
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <ros_yolo/yolo.h>

using namespace std;

int main(int argc, char **argv) {
    ros::init(argc, argv, "client_node_name");
    ros::NodeHandle n;

    cv::VideoCapture capture;
    capture.open("/home/ou/Desktop/video1.mp4");
    cv::Mat frame;

    while (capture.isOpened()) {
        capture.read(frame);

        ros::ServiceClient client = n.serviceClient<ros_yolo::yolo>("yolo_service");
        client.waitForExistence(ros::Duration(30e-3));
        ros_yolo::yolo srv;
        srv.request.image = *cv_bridge::CvImage(std_msgs::Header(), "bgr8", frame).toImageMsg();
        if (client.call(srv)) {
            ROS_INFO("request succeed");
            cout << srv.response.results.size() << endl;
            for (auto &result:srv.response.results) {
                auto xyxy = result.bbox.xyxy;
                cv::Point p1(xyxy[0], xyxy[1]), p2(xyxy[2], xyxy[3]), wh = p2 - p1;
                auto thickness = cv::min(wh.x, wh.y);
                cv::rectangle(frame, p1, p2, cv::Scalar(255, 0, 0), thickness / 40 + 1);
                cv::putText(frame, result.label, p1, cv::FONT_HERSHEY_COMPLEX,
                            1, cv::Scalar(0, 0, 255),
                            1, 0);

            }
        } else {
            ROS_ERROR("request fail");
        }
        cv::imshow("img", frame);
        cv::waitKey(1);
    }
    return 0;
}