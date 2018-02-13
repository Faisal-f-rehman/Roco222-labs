#!/usr/bin/env python
import rospy
from sensor_msgs.msg import JointState
from jointstate_to_plain.msg import Dofs

pub=None

def cb(msg):
    rospy.loginfo("Position: %s", str(msg.position))

    dofs = Dofs() 
    dofs.claws = (int) (msg.position[2] * 180/0.22)
    dofs.wrist_h = (int) (-1)*((msg.position[3] * 180/2)-180)
    dofs.wrist_v = (int) ((msg.position[5]-1.36) * 8.72 * 180/3.14)
    dofs.elbow_v = (int) (msg.position[6] * 180/0.40)
    dofs.base = (int) (msg.position[7] * 180/3.14)
    pub.publish(dofs)
    


 

if __name__ == '__main__':
 
    rospy.init_node('jointstate_to_plain')

    pub=rospy.Publisher("arm_dofs", Dofs, queue_size=1)
    rospy.Subscriber("joint_states", JointState, cb)

    

    rospy.spin()
