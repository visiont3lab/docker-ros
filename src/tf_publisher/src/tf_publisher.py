#!/usr/bin/env python  

import roslib
import rospy

import tf
import math

class TFPublisher:

    def __init__(self):
        self.count = 0
      
    def update_laser_pose(self):

        T = self.count
        w =  (math.pi/2)/10;
        Ampl_x=2.5;
        Ampl_y=2.5;
        
        x = Ampl_x*math.cos(w*T)    ;
        y = Ampl_y*math.sin(w*T);
    

        br = tf.TransformBroadcaster()
        br.sendTransform((-x, -y, 3.5),
                        tf.transformations.quaternion_from_euler(math.pi/2, math.pi/2, w*T),
                        rospy.Time.now(),
                        "rotating_frame",
                        "world")

        
        br.sendTransform((0.2, 0.2, 0.15),
                tf.transformations.quaternion_from_euler(0,0,math.pi/4),
                rospy.Time.now(),
                "laser_frame",
                "rotating_frame")
        
        self.count = self.count + 1





#theta = math.pi/2 # 90
#f = 1/T
#theta/t = w      #90/s 
#x = a*cos(theta)
#y = a*sin(theta)

if __name__ == '__main__':
    rospy.init_node('test_tf_publisher')

    r = rospy.Rate(5) # 35hz

    myTFPub = TFPublisher()

    while not rospy.is_shutdown():
        myTFPub.update_laser_pose()
        r.sleep()
 

