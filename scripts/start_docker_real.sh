 #!/bin/bash

    xhost +local:docker && \
    docker run -it \
        --name ros_melodic_desktop_real \
        --env="DISPLAY=$DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --env ROS_MASTER_URI=http://localhost:11311 \
        -v $ROS_LASER_SIM/src:/root/catkin_ws/src/ \
        ros-melodic-desktop-full \
        bash 
