;; Auto-generated. Do not edit!


(when (boundp 'ros_yolo::result)
  (if (not (find-package "ROS_YOLO"))
    (make-package "ROS_YOLO"))
  (shadow 'result (find-package "ROS_YOLO")))
(unless (find-package "ROS_YOLO::RESULT")
  (make-package "ROS_YOLO::RESULT"))

(in-package "ROS")
;;//! \htmlinclude result.msg.html


(defclass ros_yolo::result
  :super ros::object
  :slots (_prob _bbox _label _id ))

(defmethod ros_yolo::result
  (:init
   (&key
    ((:prob __prob) 0.0)
    ((:bbox __bbox) (instance ros_yolo::bbox2d :init))
    ((:label __label) "")
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _prob (float __prob))
   (setq _bbox __bbox)
   (setq _label (string __label))
   (setq _id (round __id))
   self)
  (:prob
   (&optional __prob)
   (if __prob (setq _prob __prob)) _prob)
  (:bbox
   (&rest __bbox)
   (if (keywordp (car __bbox))
       (send* _bbox __bbox)
     (progn
       (if __bbox (setq _bbox (car __bbox)))
       _bbox)))
  (:label
   (&optional __label)
   (if __label (setq _label __label)) _label)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; float32 _prob
    4
    ;; ros_yolo/bbox2d _bbox
    (send _bbox :serialization-length)
    ;; string _label
    4 (length _label)
    ;; int32 _id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _prob
       (sys::poke _prob (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; ros_yolo/bbox2d _bbox
       (send _bbox :serialize s)
     ;; string _label
       (write-long (length _label) s) (princ _label s)
     ;; int32 _id
       (write-long _id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _prob
     (setq _prob (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; ros_yolo/bbox2d _bbox
     (send _bbox :deserialize buf ptr-) (incf ptr- (send _bbox :serialization-length))
   ;; string _label
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_yolo::result :md5sum-) "4e46db6a70f293fc660c41a6da5944dc")
(setf (get ros_yolo::result :datatype-) "ros_yolo/result")
(setf (get ros_yolo::result :definition-)
      "float32 prob
bbox2d bbox
string label
int32 id
================================================================================
MSG: ros_yolo/bbox2d
float32[4] xyxy

")



(provide :ros_yolo/result "4e46db6a70f293fc660c41a6da5944dc")


