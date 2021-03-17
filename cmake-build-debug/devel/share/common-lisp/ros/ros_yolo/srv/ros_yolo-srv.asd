
(cl:in-package :asdf)

(defsystem "ros_yolo-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :ros_yolo-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "yolo" :depends-on ("_package_yolo"))
    (:file "_package_yolo" :depends-on ("_package"))
  ))