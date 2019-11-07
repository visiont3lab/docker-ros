#!/bin/bash

xfce4-terminal \
--tab --title "START_CONTAINER" --command "bash -c \"
./start_docker_sim.sh;
exec bash\""  \
--tab --title "ROSCORE" --command "bash -c \"
sleep 4 && docker exec -it ros_melodic_desktop_sim /bin/bash -c 'cd /root/catkin_ws && source /opt/ros/melodic/setup.bash && catkin_make && source /root/catkin_ws/devel/setup.bash && roscore';
exec bash\""  \
--tab --title "LASER PUBLISHER" --command "bash -c \"
sleep 90 && docker exec -it ros_melodic_desktop_sim /bin/bash -c 'source /root/catkin_ws/devel/setup.bash && roslaunch laser_publisher laser_publisher.launch --wait';
exec bash\""  \
--tab --title "RVIZ"	--command "bash -c \"
sleep 105 && docker exec -it ros_melodic_desktop_sim /bin/bash -c 'source /root/catkin_ws/devel/setup.bash && rosrun rviz rviz';
exec bash\""  \
--tab --title "TF"	--command "bash -c \"
sleep 105 && docker exec -it ros_melodic_desktop_sim /bin/bash -c 'source /root/catkin_ws/devel/setup.bash && roslaunch tf_publisher tf_publisher.launch  --wait';
exec bash\""  \
--tab --title "LASER ASSEMBLER"	--command "bash -c \"
sleep 105 && docker exec -it ros_melodic_desktop_sim /bin/bash -c 'source /root/catkin_ws/devel/setup.bash && roslaunch ler_assembler_demo assembler.launch --wait';
exec bash\""  \
--tab --title "ASSEMBLER SERVICE START"	--command "bash -c \"
sleep 105 && docker exec -it ros_melodic_desktop_sim /bin/bash -c 'source /root/catkin_ws/devel/setup.bash && roslaunch laser_assembler_demo service_client.launch --wait';
exec bash\"" & 
