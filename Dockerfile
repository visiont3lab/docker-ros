FROM osrf/ros:melodic-desktop-full
# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# docker build -t ros-melodic-desktop-full .

RUN \
apt-get update && \
apt-get -y install python-pip libzbar-dev vim apt-utils psmisc screen  \
ros-melodic-laser-assembler ros-melodic-laser-geometry ros-melodic-rqt-controller-manager  \
ros-melodic-ros-controllers ros-melodic-gazebo-ros ros-melodic-gazebo-ros-control \
ros-melodic-robot-state-publisher ros-melodic-ros-comm ros-melodic-gazebo-plugins  && \
pip install pyzbar  && \
rm -rf /var/lib/apt/lists/* 
