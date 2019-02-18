#!/bin/bash

source /opt/ros/crystal/setup.bash

echo "*************************************************************"

export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
	
ros2 run scenario2 stalker_rctf &
ros2 run scenario2 slistener_rctf &

bash

