;; Auto-generated. Do not edit!


(when (boundp 'ros_yolo::bbox2d)
  (if (not (find-package "ROS_YOLO"))
    (make-package "ROS_YOLO"))
  (shadow 'bbox2d (find-package "ROS_YOLO")))
(unless (find-package "ROS_YOLO::BBOX2D")
  (make-package "ROS_YOLO::BBOX2D"))

(in-package "ROS")
;;//! \htmlinclude bbox2d.msg.html


(defclass ros_yolo::bbox2d
  :super ros::object
  :slots (_xyxy ))

(defmethod ros_yolo::bbox2d
  (:init
   (&key
    ((:xyxy __xyxy) (make-array 4 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _xyxy __xyxy)
   self)
  (:xyxy
   (&optional __xyxy)
   (if __xyxy (setq _xyxy __xyxy)) _xyxy)
  (:serialization-length
   ()
   (+
    ;; float32[4] _xyxy
    (* 4    4)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[4] _xyxy
     (dotimes (i 4)
       (sys::poke (elt _xyxy i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[4] _xyxy
   (dotimes (i (length _xyxy))
     (setf (elt _xyxy i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get ros_yolo::bbox2d :md5sum-) "0ecde2ab30bdccc0de774e81e391154b")
(setf (get ros_yolo::bbox2d :datatype-) "ros_yolo/bbox2d")
(setf (get ros_yolo::bbox2d :definition-)
      "float32[4] xyxy

")



(provide :ros_yolo/bbox2d "0ecde2ab30bdccc0de774e81e391154b")


