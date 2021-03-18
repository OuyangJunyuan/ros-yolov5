# README

环境:ubuntu18.04 + ros-melodic + python3.8 + pytorch1.0+

编译依赖:[catkin_simple_pkg](https://github.com/catkin/catkin_simple) 下载放入同一个rosws下编译即可

## ROS Service

实现yolo作为service的server,发送sensor::Imge 图片,得到yolo检测的结果(置信度,2dbbox左上右下点坐标,附加文本信息,分类结果),	使用步骤如下:

0. 依赖安装
   1. 安装好`pytorch`
   2. `catkin-simple`放入本包同一工程下

1. 填写`config/config.demo`中参数,其中

   1. weight为保存的pytorch模型.pt文件 ,
   2.  img_size为图片大小,必须和训练时的设置一致
   3. action 为选择使用action模式还是service模式来使用ros2yolo功能

2. `demo_server.py`开头`#!/home/ou/software/anaconda3/envs/dl/bin/python`换为自己装有`pytorch`的虚拟环境下的解释器

   1. 运行`launch/service_demo.launch` 启动service-server

3. 参考`src/service_client_demo.cpp`

   ```c++
   #include <cv_bridge/cv_bridge.h>
   #include <ros_yolo/yolo.h>
   
   //instance of server-client
   ros::ServiceClient client = n.serviceClient<ros_yolo::yolo>("yolo_service");
   //request once
   ros_yolo::yolo srv;
   srv.request.image =  //sensor_msgs::Image  variable
   //send request
    if (client.call(srv)) {
   	ROS_INFO("request succeed");
        // analyze each result
   	for (auto &result:srv.response.results){
           auto prob = result.prob;  // probability of this classification
           auto xyxy = result.bbox.xyxy;  // coordinates of the upper left corner and the lower right corner
           auto text = result.label;  // addtional infomation 
           auto cls = result.id;  // classification result 
           // ....
       }
   }else {
   	ROS_ERROR("request fail");
   }
   ```





## ROS Action

填写`config/config.demo`中参数 `action=True`

action-client 参考`src/action_client_demo.cpp`

action_client发出的goal只需包含iamge即`goal.image = //sensor_msgs::Image`

action_client接受到的结果`result`包含原始图像msg和检测结果即`result->image 和 result->result `