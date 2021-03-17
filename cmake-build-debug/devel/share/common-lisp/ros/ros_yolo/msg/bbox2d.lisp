; Auto-generated. Do not edit!


(cl:in-package ros_yolo-msg)


;//! \htmlinclude bbox2d.msg.html

(cl:defclass <bbox2d> (roslisp-msg-protocol:ros-message)
  ((xyxy
    :reader xyxy
    :initarg :xyxy
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass bbox2d (<bbox2d>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <bbox2d>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'bbox2d)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_yolo-msg:<bbox2d> is deprecated: use ros_yolo-msg:bbox2d instead.")))

(cl:ensure-generic-function 'xyxy-val :lambda-list '(m))
(cl:defmethod xyxy-val ((m <bbox2d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_yolo-msg:xyxy-val is deprecated.  Use ros_yolo-msg:xyxy instead.")
  (xyxy m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <bbox2d>) ostream)
  "Serializes a message object of type '<bbox2d>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'xyxy))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <bbox2d>) istream)
  "Deserializes a message object of type '<bbox2d>"
  (cl:setf (cl:slot-value msg 'xyxy) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'xyxy)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<bbox2d>)))
  "Returns string type for a message object of type '<bbox2d>"
  "ros_yolo/bbox2d")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bbox2d)))
  "Returns string type for a message object of type 'bbox2d"
  "ros_yolo/bbox2d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<bbox2d>)))
  "Returns md5sum for a message object of type '<bbox2d>"
  "0ecde2ab30bdccc0de774e81e391154b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'bbox2d)))
  "Returns md5sum for a message object of type 'bbox2d"
  "0ecde2ab30bdccc0de774e81e391154b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<bbox2d>)))
  "Returns full string definition for message of type '<bbox2d>"
  (cl:format cl:nil "float32[4] xyxy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'bbox2d)))
  "Returns full string definition for message of type 'bbox2d"
  (cl:format cl:nil "float32[4] xyxy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <bbox2d>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'xyxy) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <bbox2d>))
  "Converts a ROS message object to a list"
  (cl:list 'bbox2d
    (cl:cons ':xyxy (xyxy msg))
))
