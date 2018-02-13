; Auto-generated. Do not edit!


(cl:in-package jointstate_to_plain-msg)


;//! \htmlinclude Dofs.msg.html

(cl:defclass <Dofs> (roslisp-msg-protocol:ros-message)
  ((base
    :reader base
    :initarg :base
    :type cl:fixnum
    :initform 0)
   (elbow_v
    :reader elbow_v
    :initarg :elbow_v
    :type cl:fixnum
    :initform 0)
   (wrist_v
    :reader wrist_v
    :initarg :wrist_v
    :type cl:fixnum
    :initform 0)
   (wrist_h
    :reader wrist_h
    :initarg :wrist_h
    :type cl:fixnum
    :initform 0)
   (claws
    :reader claws
    :initarg :claws
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Dofs (<Dofs>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Dofs>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Dofs)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name jointstate_to_plain-msg:<Dofs> is deprecated: use jointstate_to_plain-msg:Dofs instead.")))

(cl:ensure-generic-function 'base-val :lambda-list '(m))
(cl:defmethod base-val ((m <Dofs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jointstate_to_plain-msg:base-val is deprecated.  Use jointstate_to_plain-msg:base instead.")
  (base m))

(cl:ensure-generic-function 'elbow_v-val :lambda-list '(m))
(cl:defmethod elbow_v-val ((m <Dofs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jointstate_to_plain-msg:elbow_v-val is deprecated.  Use jointstate_to_plain-msg:elbow_v instead.")
  (elbow_v m))

(cl:ensure-generic-function 'wrist_v-val :lambda-list '(m))
(cl:defmethod wrist_v-val ((m <Dofs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jointstate_to_plain-msg:wrist_v-val is deprecated.  Use jointstate_to_plain-msg:wrist_v instead.")
  (wrist_v m))

(cl:ensure-generic-function 'wrist_h-val :lambda-list '(m))
(cl:defmethod wrist_h-val ((m <Dofs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jointstate_to_plain-msg:wrist_h-val is deprecated.  Use jointstate_to_plain-msg:wrist_h instead.")
  (wrist_h m))

(cl:ensure-generic-function 'claws-val :lambda-list '(m))
(cl:defmethod claws-val ((m <Dofs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jointstate_to_plain-msg:claws-val is deprecated.  Use jointstate_to_plain-msg:claws instead.")
  (claws m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Dofs>) ostream)
  "Serializes a message object of type '<Dofs>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'base)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'base)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'elbow_v)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'elbow_v)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wrist_v)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wrist_v)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wrist_h)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wrist_h)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'claws)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'claws)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Dofs>) istream)
  "Deserializes a message object of type '<Dofs>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'base)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'base)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'elbow_v)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'elbow_v)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wrist_v)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wrist_v)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wrist_h)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wrist_h)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'claws)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'claws)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Dofs>)))
  "Returns string type for a message object of type '<Dofs>"
  "jointstate_to_plain/Dofs")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Dofs)))
  "Returns string type for a message object of type 'Dofs"
  "jointstate_to_plain/Dofs")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Dofs>)))
  "Returns md5sum for a message object of type '<Dofs>"
  "48ee67495ded0c011b71d34f7f38a20a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Dofs)))
  "Returns md5sum for a message object of type 'Dofs"
  "48ee67495ded0c011b71d34f7f38a20a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Dofs>)))
  "Returns full string definition for message of type '<Dofs>"
  (cl:format cl:nil "uint16 base~%uint16 elbow_v~%uint16 wrist_v~%uint16 wrist_h~%uint16 claws~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Dofs)))
  "Returns full string definition for message of type 'Dofs"
  (cl:format cl:nil "uint16 base~%uint16 elbow_v~%uint16 wrist_v~%uint16 wrist_h~%uint16 claws~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Dofs>))
  (cl:+ 0
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Dofs>))
  "Converts a ROS message object to a list"
  (cl:list 'Dofs
    (cl:cons ':base (base msg))
    (cl:cons ':elbow_v (elbow_v msg))
    (cl:cons ':wrist_v (wrist_v msg))
    (cl:cons ':wrist_h (wrist_h msg))
    (cl:cons ':claws (claws msg))
))
