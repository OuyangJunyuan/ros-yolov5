; Auto-generated. Do not edit!


(cl:in-package ros_yolo-srv)


;//! \htmlinclude yolo-request.msg.html

(cl:defclass <yolo-request> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass yolo-request (<yolo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <yolo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'yolo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_yolo-srv:<yolo-request> is deprecated: use ros_yolo-srv:yolo-request instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <yolo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_yolo-srv:image-val is deprecated.  Use ros_yolo-srv:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <yolo-request>) ostream)
  "Serializes a message object of type '<yolo-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <yolo-request>) istream)
  "Deserializes a message object of type '<yolo-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<yolo-request>)))
  "Returns string type for a service object of type '<yolo-request>"
  "ros_yolo/yoloRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'yolo-request)))
  "Returns string type for a service object of type 'yolo-request"
  "ros_yolo/yoloRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<yolo-request>)))
  "Returns md5sum for a message object of type '<yolo-request>"
  "7eb4406e158bf79420efaf7a3b5c1d6c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'yolo-request)))
  "Returns md5sum for a message object of type 'yolo-request"
  "7eb4406e158bf79420efaf7a3b5c1d6c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<yolo-request>)))
  "Returns full string definition for message of type '<yolo-request>"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'yolo-request)))
  "Returns full string definition for message of type 'yolo-request"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <yolo-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <yolo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'yolo-request
    (cl:cons ':image (image msg))
))
;//! \htmlinclude yolo-response.msg.html

(cl:defclass <yolo-response> (roslisp-msg-protocol:ros-message)
  ((results
    :reader results
    :initarg :results
    :type (cl:vector ros_yolo-msg:result)
   :initform (cl:make-array 0 :element-type 'ros_yolo-msg:result :initial-element (cl:make-instance 'ros_yolo-msg:result))))
)

(cl:defclass yolo-response (<yolo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <yolo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'yolo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_yolo-srv:<yolo-response> is deprecated: use ros_yolo-srv:yolo-response instead.")))

(cl:ensure-generic-function 'results-val :lambda-list '(m))
(cl:defmethod results-val ((m <yolo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_yolo-srv:results-val is deprecated.  Use ros_yolo-srv:results instead.")
  (results m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <yolo-response>) ostream)
  "Serializes a message object of type '<yolo-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'results))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'results))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <yolo-response>) istream)
  "Deserializes a message object of type '<yolo-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'results) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'results)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ros_yolo-msg:result))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<yolo-response>)))
  "Returns string type for a service object of type '<yolo-response>"
  "ros_yolo/yoloResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'yolo-response)))
  "Returns string type for a service object of type 'yolo-response"
  "ros_yolo/yoloResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<yolo-response>)))
  "Returns md5sum for a message object of type '<yolo-response>"
  "7eb4406e158bf79420efaf7a3b5c1d6c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'yolo-response)))
  "Returns md5sum for a message object of type 'yolo-response"
  "7eb4406e158bf79420efaf7a3b5c1d6c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<yolo-response>)))
  "Returns full string definition for message of type '<yolo-response>"
  (cl:format cl:nil "result[] results~%~%================================================================================~%MSG: ros_yolo/result~%float32 prob~%bbox2d bbox~%string label~%int32 id~%================================================================================~%MSG: ros_yolo/bbox2d~%float32[4] xyxy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'yolo-response)))
  "Returns full string definition for message of type 'yolo-response"
  (cl:format cl:nil "result[] results~%~%================================================================================~%MSG: ros_yolo/result~%float32 prob~%bbox2d bbox~%string label~%int32 id~%================================================================================~%MSG: ros_yolo/bbox2d~%float32[4] xyxy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <yolo-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'results) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <yolo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'yolo-response
    (cl:cons ':results (results msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'yolo)))
  'yolo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'yolo)))
  'yolo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'yolo)))
  "Returns string type for a service object of type '<yolo>"
  "ros_yolo/yolo")