#!/usr/bin/env python

from __future__ import print_function
import sys
import rospy
from sensor_msgs.msg import LaserScan
import json
import math

class LaserPublisher:

    def __init__(self):
        self.laser_pub = rospy.Publisher("/laser/scan",LaserScan,queue_size=1)
        self.count = 0
      
    def prepare_data(self):
        #filename = "/root/catkin_ws/src/laser_publisher/src/vuoto_out.json"
        filename = "/root/catkin_ws/src/laser_publisher/src/sagoma_out.json"
        

        #Read JSON data into the datastore variable
        with open(filename, 'r') as f:
            loaded_json = json.load(f)
  
        all_samples = loaded_json["samples"]


        data_vec = []
        for i in  range (0,len(all_samples)):
            temp_data = all_samples[i]["data"]
            
            temp_data_vec = []
            num_readings =  len(temp_data)
            #print(num_readings)
            for j in  range (0,len(temp_data)):
                temp_distance = temp_data[j]["distance"]/1000.0 # convert to millimeters
                #print(temp_distance)
                temp_data_vec.append(temp_distance)
            
            data_vec.append(temp_data_vec)
        
        return data_vec 
    
    def build_laser_scan(self, ranges):
        
        arc = math.pi/2       # Laser arc  45 to 135 = 90 deg (in laser coordinate frame -45 45)
        num_readings = 181    # number of readings of the laser (len(temp_data))
        laser_frequency = 5

        result = LaserScan()
        result.header.stamp = rospy.Time.now()
        result.header.frame_id = "laser_frame";
        result.angle_min = -0.785398 # math.PI/4 -45 degree
        result.angle_max = 0.785398  #math.PI/4  45 degree
        result.angle_increment = arc/num_readings # 5 degree
        result.time_increment = (1 / laser_frequency) / (num_readings);
        result.range_min = 0.0
        result.range_max = 26.0
        result.ranges = ranges; 

        return result

    def run(self,data_vec):
        #print(data_vec[self.count])
        scanLaserRos = self.build_laser_scan(data_vec[self.count])
        self.laser_pub.publish(scanLaserRos)
        self.count = self.count + 1
            
def main(args):
    rospy.init_node("test_laser_publisher")

    ic = LaserPublisher()
    laserData = ic.prepare_data()

    r = rospy.Rate(35) # 35hz
    while not rospy.is_shutdown():
        ic.run(laserData)
        r.sleep()

if __name__ == '__main__':
    main(sys.argv)