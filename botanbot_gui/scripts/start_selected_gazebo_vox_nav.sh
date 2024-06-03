#!/bin/bash
current_dir="$(dirname "${BASH_SOURCE[0]}")"  # get the directory name
current_dir="$(realpath "${current_dir}")"    # resolve its full path if
source /opt/ros/$ROS_DISTRO/setup.bash
source $current_dir/../../../install/setup.bash
source ~/.bashrc
echo "going to shut down any active gzserver before starting ..."
killall gzserver
export GAZEBO_WORLD=$GAZEBO_WORLD$1
ros2_launch_command="ros2 launch botanbot_bringup botanbot_simulation.launch.py; bash"
gnome-terminal -- sh -c "$ros2_launch_command"
echo "executing command: $ros2_launch_command"
echo "selected world is: $GAZEBO_WORLD"