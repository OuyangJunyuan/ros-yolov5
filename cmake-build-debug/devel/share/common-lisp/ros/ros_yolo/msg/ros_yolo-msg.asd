
(cl:in-package :asdf)

(defsystem "ros_yolo-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "bbox2d" :depends-on ("_package_bbox2d"))
    (:file "_package_bbox2d" :depends-on ("_package"))
    (:file "result" :depends-on ("_package_result"))
    (:file "_package_result" :depends-on ("_package"))
    (:file "yoloAction" :depends-on ("_package_yoloAction"))
    (:file "_package_yoloAction" :depends-on ("_package"))
    (:file "yoloActionFeedback" :depends-on ("_package_yoloActionFeedback"))
    (:file "_package_yoloActionFeedback" :depends-on ("_package"))
    (:file "yoloActionGoal" :depends-on ("_package_yoloActionGoal"))
    (:file "_package_yoloActionGoal" :depends-on ("_package"))
    (:file "yoloActionResult" :depends-on ("_package_yoloActionResult"))
    (:file "_package_yoloActionResult" :depends-on ("_package"))
    (:file "yoloFeedback" :depends-on ("_package_yoloFeedback"))
    (:file "_package_yoloFeedback" :depends-on ("_package"))
    (:file "yoloGoal" :depends-on ("_package_yoloGoal"))
    (:file "_package_yoloGoal" :depends-on ("_package"))
    (:file "yoloResult" :depends-on ("_package_yoloResult"))
    (:file "_package_yoloResult" :depends-on ("_package"))
  ))