;; Auto-generated. Do not edit!


(when (boundp 'ros_yolo::yolo)
  (if (not (find-package "ROS_YOLO"))
    (make-package "ROS_YOLO"))
  (shadow 'yolo (find-package "ROS_YOLO")))
(unless (find-package "ROS_YOLO::YOLO")
  (make-package "ROS_YOLO::YOLO"))
(unless (find-package "ROS_YOLO::YOLOREQUEST")
  (make-package "ROS_YOLO::YOLOREQUEST"))
(unless (find-package "ROS_YOLO::YOLORESPONSE")
  (make-package "ROS_YOLO::YOLORESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass ros_yolo::yoloRequest
  :super ros::object
  :slots (_image ))

(defmethod ros_yolo::yoloRequest
  (:init
   (&key
    ((:image __image) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _image __image)
   self)
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _image
    (send _image :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _image
       (send _image :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _image
     (send _image :deserialize buf ptr-) (incf ptr- (send _image :serialization-length))
   ;;
   self)
  )

(defclass ros_yolo::yoloResponse
  :super ros::object
  :slots (_results ))

(defmethod ros_yolo::yoloResponse
  (:init
   (&key
    ((:results __results) (let (r) (dotimes (i 0) (push (instance ros_yolo::result :init) r)) r))
    )
   (send-super :init)
   (setq _results __results)
   self)
  (:results
   (&rest __results)
   (if (keywordp (car __results))
       (send* _results __results)
     (progn
       (if __results (setq _results (car __results)))
       _results)))
  (:serialization-length
   ()
   (+
    ;; ros_yolo/result[] _results
    (apply #'+ (send-all _results :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ros_yolo/result[] _results
     (write-long (length _results) s)
     (dolist (elem _results)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ros_yolo/result[] _results
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _results (let (r) (dotimes (i n) (push (instance ros_yolo::result :init) r)) r))
     (dolist (elem- _results)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass ros_yolo::yolo
  :super ros::object
  :slots ())

(setf (get ros_yolo::yolo :md5sum-) "7eb4406e158bf79420efaf7a3b5c1d6c")
(setf (get ros_yolo::yolo :datatype-) "ros_yolo/yolo")
(setf (get ros_yolo::yolo :request) ros_yolo::yoloRequest)
(setf (get ros_yolo::yolo :response) ros_yolo::yoloResponse)

(defmethod ros_yolo::yoloRequest
  (:response () (instance ros_yolo::yoloResponse :init)))

(setf (get ros_yolo::yoloRequest :md5sum-) "7eb4406e158bf79420efaf7a3b5c1d6c")
(setf (get ros_yolo::yoloRequest :datatype-) "ros_yolo/yoloRequest")
(setf (get ros_yolo::yoloRequest :definition-)
      "sensor_msgs/Image image

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
result[] results

================================================================================
MSG: ros_yolo/result
float32 prob
bbox2d bbox
string label
int32 id
================================================================================
MSG: ros_yolo/bbox2d
float32[4] xyxy
")

(setf (get ros_yolo::yoloResponse :md5sum-) "7eb4406e158bf79420efaf7a3b5c1d6c")
(setf (get ros_yolo::yoloResponse :datatype-) "ros_yolo/yoloResponse")
(setf (get ros_yolo::yoloResponse :definition-)
      "sensor_msgs/Image image

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
result[] results

================================================================================
MSG: ros_yolo/result
float32 prob
bbox2d bbox
string label
int32 id
================================================================================
MSG: ros_yolo/bbox2d
float32[4] xyxy
")



(provide :ros_yolo/yolo "7eb4406e158bf79420efaf7a3b5c1d6c")


