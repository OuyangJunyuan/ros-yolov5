// Auto-generated. Do not edit!

// (in-package ros_yolo.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class bbox2d {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xyxy = null;
    }
    else {
      if (initObj.hasOwnProperty('xyxy')) {
        this.xyxy = initObj.xyxy
      }
      else {
        this.xyxy = new Array(4).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type bbox2d
    // Check that the constant length array field [xyxy] has the right length
    if (obj.xyxy.length !== 4) {
      throw new Error('Unable to serialize array field xyxy - length must be 4')
    }
    // Serialize message field [xyxy]
    bufferOffset = _arraySerializer.float32(obj.xyxy, buffer, bufferOffset, 4);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type bbox2d
    let len;
    let data = new bbox2d(null);
    // Deserialize message field [xyxy]
    data.xyxy = _arrayDeserializer.float32(buffer, bufferOffset, 4)
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_yolo/bbox2d';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0ecde2ab30bdccc0de774e81e391154b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[4] xyxy
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new bbox2d(null);
    if (msg.xyxy !== undefined) {
      resolved.xyxy = msg.xyxy;
    }
    else {
      resolved.xyxy = new Array(4).fill(0)
    }

    return resolved;
    }
};

module.exports = bbox2d;
