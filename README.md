## Docker ROS
We are going to simulation an laser scan acquisition using RVIZ. Everything will run inside a docker container.

## Requirements
Install docker

## Setup 

Setup environment variable

```
echo "export MYROSWORKSPACE=$HOME/docker-ros" >> $HOME/.bashrc && source $HOME/.bashrc
```

Build docker

```
cd $MYROSWORKSPACE && docker build -t ros_melodic_desktop_full .
```

## Launch laser simulation

```
cd $MYROSWORKSPACE/srcipts && ./launch_laser_sim.sh
```

After finishing remember to type 

```
docker stop ros_melodic_desktop_sim
```

## Development purpose 

Real world docker

```
cd $MYROSWORKSPACE/scripts && ./start_docker_real.sh
```

Simulation docker 

```
cd $MYROSWORKSPACE/scripts && ./start_docker_sim.sh
```

## Useful commands

Access docker containers

```
docker exec -it ros_melodic_desktop_full_real /bin/bash
docker exec -it ros_melodic_desktop_full_sim /bin/bash
```


