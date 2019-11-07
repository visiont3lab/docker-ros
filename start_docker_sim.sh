 #!/bin/bash

    xhost +local:docker && \
    docker run -it \
        --name ros_melodic_desktop_sim \
        --env="DISPLAY=$DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --env ROS_MASTER_URI=http://localhost:11311 \
        --publish="30000:30000" \
        --runtime=nvidia \
        --device=/dev/snd \
        -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
        -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native:Z \
        --group-add $(getent group audio | cut -d: -f3) \
        -v $MYROSWORKSPACE/src/config.yaml:/root/.ignition/fuel/config.yaml  \
        -v $MYROSWORKSPACE/src:/root/catkin_ws/src/ \
        ros-melodic-desktop-full \
        bash 
