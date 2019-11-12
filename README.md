
# Docker ROS Laser Scan Rviz Pointcloud Simulation

## Introduction

We are going to simulation an laser scan acquisition using RVIZ. Everything will run inside a docker container.

## Requirements

* [Install docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)
* [Install nvidia-docker2](https://github.com/NVIDIA/nvidia-docker)

## Setup

```
cd $HOME
sudo apt install xfce4-terminal && \
git clone https://github.com/visiont3lab/docker-ros-laser-sim.git && \
echo "export ROS_LASER_SIM=$HOME/docker-ros-laser-sim" >> $HOME/.bashrc && source $HOME/.bashrc
```
Feel free to modify the path as you like!

## Run

```
cd $ROS_LASER_SIM/scripts && ./launch_laser_sim.sh
```

After finishing remember to type 

```
docker stop ros_melodic_desktop_laser_sim
```

## References

[Main Reference](http://ros-developer.com/2017/08/03/assembling-laser-scans-into-pcl-point-cloud-using-gazebo-and-ros/) <br>
[Tf transform](https://gist.github.com/martimorta/64bc08ba9934b1ad7a02) <br>
[Amazing Article](https://community.arm.com/developer/research/b/articles/posts/do-you-want-to-build-a-robot) <br>
[Laser assembler](https://www.youtube.com/watch?v=MyA0as18Wkk&feature=youtu.be)


## Extra: Build docker image

```
cd $ROS_LASER_SIM && docker build -t ros-melodic-desktop-full .
```


