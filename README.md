## Docker ROS

## Requirements
Install docker

## Setup 
Development environment for using ROS with both simualtion and real time.

Setup environment variable

```
echo "export MYROSWORKSPACE=$HOME/docker-ros" >> $HOME/.bashrc && source $HOME/.bashrc
```

Build docker

```
cd $MYWORKSPACE
docker build -t ros_melodic_desktop_full .
```

Real world docker

```
./start_docker_real.sh
```

Simulation docker 

```
./start_docker_sim.sh
```

## Useful commands

Access docker containers

```
docker exec -it ros_melodic_desktop_full_real /bin/bash
docker exec -it ros_melodic_desktop_full_sim /bin/bash
```


