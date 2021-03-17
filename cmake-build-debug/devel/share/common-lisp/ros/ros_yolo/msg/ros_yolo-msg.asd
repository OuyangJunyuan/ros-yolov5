
(cl:in-package :asdf)

(defsystem "ros_yolo-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "bbox2d" :depends-on ("_package_bbox2d"))
    (:file "_package_bbox2d" :depends-on ("_package"))
    (:file "result" :depends-on ("_package_result"))
    (:file "_package_result" :depends-on ("_package"))
  ))