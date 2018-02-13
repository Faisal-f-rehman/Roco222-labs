#ifndef _ROS_jointstate_to_plain_Dofs_h
#define _ROS_jointstate_to_plain_Dofs_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace jointstate_to_plain
{

  class Dofs : public ros::Msg
  {
    public:
      typedef uint16_t _base_type;
      _base_type base;
      typedef uint16_t _elbow_v_type;
      _elbow_v_type elbow_v;
      typedef uint16_t _wrist_v_type;
      _wrist_v_type wrist_v;
      typedef uint16_t _wrist_h_type;
      _wrist_h_type wrist_h;
      typedef uint16_t _claws_type;
      _claws_type claws;

    Dofs():
      base(0),
      elbow_v(0),
      wrist_v(0),
      wrist_h(0),
      claws(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->base);
      *(outbuffer + offset + 0) = (this->elbow_v >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->elbow_v >> (8 * 1)) & 0xFF;
      offset += sizeof(this->elbow_v);
      *(outbuffer + offset + 0) = (this->wrist_v >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->wrist_v >> (8 * 1)) & 0xFF;
      offset += sizeof(this->wrist_v);
      *(outbuffer + offset + 0) = (this->wrist_h >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->wrist_h >> (8 * 1)) & 0xFF;
      offset += sizeof(this->wrist_h);
      *(outbuffer + offset + 0) = (this->claws >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->claws >> (8 * 1)) & 0xFF;
      offset += sizeof(this->claws);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      this->base =  ((uint16_t) (*(inbuffer + offset)));
      this->base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      offset += sizeof(this->base);
      this->elbow_v =  ((uint16_t) (*(inbuffer + offset)));
      this->elbow_v |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      offset += sizeof(this->elbow_v);
      this->wrist_v =  ((uint16_t) (*(inbuffer + offset)));
      this->wrist_v |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      offset += sizeof(this->wrist_v);
      this->wrist_h =  ((uint16_t) (*(inbuffer + offset)));
      this->wrist_h |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      offset += sizeof(this->wrist_h);
      this->claws =  ((uint16_t) (*(inbuffer + offset)));
      this->claws |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      offset += sizeof(this->claws);
     return offset;
    }

    const char * getType(){ return "jointstate_to_plain/Dofs"; };
    const char * getMD5(){ return "48ee67495ded0c011b71d34f7f38a20a"; };

  };

}
#endif
