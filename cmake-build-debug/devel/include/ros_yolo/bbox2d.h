// Generated by gencpp from file ros_yolo/bbox2d.msg
// DO NOT EDIT!


#ifndef ROS_YOLO_MESSAGE_BBOX2D_H
#define ROS_YOLO_MESSAGE_BBOX2D_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ros_yolo
{
template <class ContainerAllocator>
struct bbox2d_
{
  typedef bbox2d_<ContainerAllocator> Type;

  bbox2d_()
    : xyxy()  {
      xyxy.assign(0.0);
  }
  bbox2d_(const ContainerAllocator& _alloc)
    : xyxy()  {
  (void)_alloc;
      xyxy.assign(0.0);
  }



   typedef boost::array<float, 4>  _xyxy_type;
  _xyxy_type xyxy;





  typedef boost::shared_ptr< ::ros_yolo::bbox2d_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_yolo::bbox2d_<ContainerAllocator> const> ConstPtr;

}; // struct bbox2d_

typedef ::ros_yolo::bbox2d_<std::allocator<void> > bbox2d;

typedef boost::shared_ptr< ::ros_yolo::bbox2d > bbox2dPtr;
typedef boost::shared_ptr< ::ros_yolo::bbox2d const> bbox2dConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_yolo::bbox2d_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_yolo::bbox2d_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_yolo::bbox2d_<ContainerAllocator1> & lhs, const ::ros_yolo::bbox2d_<ContainerAllocator2> & rhs)
{
  return lhs.xyxy == rhs.xyxy;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_yolo::bbox2d_<ContainerAllocator1> & lhs, const ::ros_yolo::bbox2d_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_yolo

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::ros_yolo::bbox2d_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_yolo::bbox2d_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_yolo::bbox2d_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_yolo::bbox2d_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_yolo::bbox2d_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_yolo::bbox2d_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_yolo::bbox2d_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0ecde2ab30bdccc0de774e81e391154b";
  }

  static const char* value(const ::ros_yolo::bbox2d_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0ecde2ab30bdccc0ULL;
  static const uint64_t static_value2 = 0xde774e81e391154bULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_yolo::bbox2d_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_yolo/bbox2d";
  }

  static const char* value(const ::ros_yolo::bbox2d_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_yolo::bbox2d_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[4] xyxy\n"
;
  }

  static const char* value(const ::ros_yolo::bbox2d_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_yolo::bbox2d_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.xyxy);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct bbox2d_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_yolo::bbox2d_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_yolo::bbox2d_<ContainerAllocator>& v)
  {
    s << indent << "xyxy[]" << std::endl;
    for (size_t i = 0; i < v.xyxy.size(); ++i)
    {
      s << indent << "  xyxy[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.xyxy[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_YOLO_MESSAGE_BBOX2D_H