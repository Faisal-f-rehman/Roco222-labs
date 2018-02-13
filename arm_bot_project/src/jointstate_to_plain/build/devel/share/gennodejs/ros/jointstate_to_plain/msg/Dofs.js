// Auto-generated. Do not edit!

// (in-package jointstate_to_plain.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Dofs {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.base = null;
      this.elbow_v = null;
      this.wrist_v = null;
      this.wrist_h = null;
      this.claws = null;
    }
    else {
      if (initObj.hasOwnProperty('base')) {
        this.base = initObj.base
      }
      else {
        this.base = 0;
      }
      if (initObj.hasOwnProperty('elbow_v')) {
        this.elbow_v = initObj.elbow_v
      }
      else {
        this.elbow_v = 0;
      }
      if (initObj.hasOwnProperty('wrist_v')) {
        this.wrist_v = initObj.wrist_v
      }
      else {
        this.wrist_v = 0;
      }
      if (initObj.hasOwnProperty('wrist_h')) {
        this.wrist_h = initObj.wrist_h
      }
      else {
        this.wrist_h = 0;
      }
      if (initObj.hasOwnProperty('claws')) {
        this.claws = initObj.claws
      }
      else {
        this.claws = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Dofs
    // Serialize message field [base]
    bufferOffset = _serializer.uint16(obj.base, buffer, bufferOffset);
    // Serialize message field [elbow_v]
    bufferOffset = _serializer.uint16(obj.elbow_v, buffer, bufferOffset);
    // Serialize message field [wrist_v]
    bufferOffset = _serializer.uint16(obj.wrist_v, buffer, bufferOffset);
    // Serialize message field [wrist_h]
    bufferOffset = _serializer.uint16(obj.wrist_h, buffer, bufferOffset);
    // Serialize message field [claws]
    bufferOffset = _serializer.uint16(obj.claws, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Dofs
    let len;
    let data = new Dofs(null);
    // Deserialize message field [base]
    data.base = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [elbow_v]
    data.elbow_v = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [wrist_v]
    data.wrist_v = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [wrist_h]
    data.wrist_h = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [claws]
    data.claws = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'jointstate_to_plain/Dofs';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '48ee67495ded0c011b71d34f7f38a20a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 base
    uint16 elbow_v
    uint16 wrist_v
    uint16 wrist_h
    uint16 claws
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Dofs(null);
    if (msg.base !== undefined) {
      resolved.base = msg.base;
    }
    else {
      resolved.base = 0
    }

    if (msg.elbow_v !== undefined) {
      resolved.elbow_v = msg.elbow_v;
    }
    else {
      resolved.elbow_v = 0
    }

    if (msg.wrist_v !== undefined) {
      resolved.wrist_v = msg.wrist_v;
    }
    else {
      resolved.wrist_v = 0
    }

    if (msg.wrist_h !== undefined) {
      resolved.wrist_h = msg.wrist_h;
    }
    else {
      resolved.wrist_h = 0
    }

    if (msg.claws !== undefined) {
      resolved.claws = msg.claws;
    }
    else {
      resolved.claws = 0
    }

    return resolved;
    }
};

module.exports = Dofs;
