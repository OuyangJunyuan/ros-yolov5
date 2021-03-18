//
// Created by ou on 2021/3/18.
//
#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>

#include <cv_bridge/cv_bridge.h>
#include <ros_yolo/yolo.h>
#include <ros_yolo/yoloAction.h>

#include <boost/thread.hpp>
#include <opencv2/opencv.hpp>

using namespace std;

void actionDoneCallBack(const actionlib::SimpleClientGoalState &state,
                        const ros_yolo::yoloResultConstPtr &result);

void spinfunc(void);


int main(int argc, char **argv) {
    ros::init(argc, argv, "client_node");
    ros::NodeHandle n;

    bool isAction = false;
    n.getParam("yolov5/action", isAction);
    if (!isAction) {
        ROS_ERROR("no in action mode, please modify the .yaml file and reload");
        return 0;
    }
    boost::thread thread_spin(spinfunc);
    // start client after spin_thread was up
    actionlib::SimpleActionClient<ros_yolo::yoloAction> client("yolo_action", true);
    client.waitForServer();
    ROS_INFO("action 'yolo_action' server exist ");


    cv::VideoCapture capture;
    capture.open("/home/ou/Desktop/video1.mp4");
    cv::Mat frame;
    while (capture.isOpened()) {
        capture.read(frame);

        ros_yolo::yoloGoal goal;
        goal.image = *cv_bridge::CvImage(std_msgs::Header(), "bgr8", frame).toImageMsg();
        client.sendGoal(goal, boost::bind(actionDoneCallBack, _1, _2));
        client.waitForResult();  // comment this line  when blocking is not needed
    }

    thread_spin.join();
    return 0;
}

void spinfunc(void) {
    while (ros::ok()) {
        ros::spinOnce();
    }
}

void actionDoneCallBack(const actionlib::SimpleClientGoalState &state,
                        const ros_yolo::yoloResultConstPtr &result) {
    cout << "----------------" << endl;
    cout << "detect: " << result->results.size() << " objects" << endl;
    cv::Mat frame;
    frame = cv_bridge::toCvCopy(result->image, "bgr8")->image;
    for (auto &result:result->results) {
        auto xyxy = result.bbox.xyxy;
        cv::Point p1(xyxy[0], xyxy[1]), p2(xyxy[2], xyxy[3]), wh = p2 - p1;
        auto thickness = cv::min(wh.x, wh.y);
        cv::rectangle(frame, p1, p2, cv::Scalar(255, 0, 0), thickness / 40 + 1);
        cv::putText(frame, result.label, p1, cv::FONT_HERSHEY_COMPLEX,
                    1, cv::Scalar(0, 0, 255),
                    1, 0);
        cout << result.label << endl;
    }
    cv::imshow("img", frame);
    cv::waitKey(1);
}



