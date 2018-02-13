;; Auto-generated. Do not edit!


(when (boundp 'jointstate_to_plain::Dofs)
  (if (not (find-package "JOINTSTATE_TO_PLAIN"))
    (make-package "JOINTSTATE_TO_PLAIN"))
  (shadow 'Dofs (find-package "JOINTSTATE_TO_PLAIN")))
(unless (find-package "JOINTSTATE_TO_PLAIN::DOFS")
  (make-package "JOINTSTATE_TO_PLAIN::DOFS"))

(in-package "ROS")
;;//! \htmlinclude Dofs.msg.html


(defclass jointstate_to_plain::Dofs
  :super ros::object
  :slots (_base _elbow_v _wrist_v _wrist_h _claws ))

(defmethod jointstate_to_plain::Dofs
  (:init
   (&key
    ((:base __base) 0)
    ((:elbow_v __elbow_v) 0)
    ((:wrist_v __wrist_v) 0)
    ((:wrist_h __wrist_h) 0)
    ((:claws __claws) 0)
    )
   (send-super :init)
   (setq _base (round __base))
   (setq _elbow_v (round __elbow_v))
   (setq _wrist_v (round __wrist_v))
   (setq _wrist_h (round __wrist_h))
   (setq _claws (round __claws))
   self)
  (:base
   (&optional __base)
   (if __base (setq _base __base)) _base)
  (:elbow_v
   (&optional __elbow_v)
   (if __elbow_v (setq _elbow_v __elbow_v)) _elbow_v)
  (:wrist_v
   (&optional __wrist_v)
   (if __wrist_v (setq _wrist_v __wrist_v)) _wrist_v)
  (:wrist_h
   (&optional __wrist_h)
   (if __wrist_h (setq _wrist_h __wrist_h)) _wrist_h)
  (:claws
   (&optional __claws)
   (if __claws (setq _claws __claws)) _claws)
  (:serialization-length
   ()
   (+
    ;; uint16 _base
    2
    ;; uint16 _elbow_v
    2
    ;; uint16 _wrist_v
    2
    ;; uint16 _wrist_h
    2
    ;; uint16 _claws
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _base
       (write-word _base s)
     ;; uint16 _elbow_v
       (write-word _elbow_v s)
     ;; uint16 _wrist_v
       (write-word _wrist_v s)
     ;; uint16 _wrist_h
       (write-word _wrist_h s)
     ;; uint16 _claws
       (write-word _claws s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _base
     (setq _base (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _elbow_v
     (setq _elbow_v (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _wrist_v
     (setq _wrist_v (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _wrist_h
     (setq _wrist_h (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _claws
     (setq _claws (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get jointstate_to_plain::Dofs :md5sum-) "48ee67495ded0c011b71d34f7f38a20a")
(setf (get jointstate_to_plain::Dofs :datatype-) "jointstate_to_plain/Dofs")
(setf (get jointstate_to_plain::Dofs :definition-)
      "uint16 base
uint16 elbow_v
uint16 wrist_v
uint16 wrist_h
uint16 claws

")



(provide :jointstate_to_plain/Dofs "48ee67495ded0c011b71d34f7f38a20a")


