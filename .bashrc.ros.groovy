# ROS
export ROS_IP=`hostname -I|sed -e 's/ /\n/g'|grep 11`
#export ROS_HOSTNAME=$ROS_IP

#source /opt/ros/groovy/setup.bash
#source ~/ros_catkin_ws/groovy/devel/setup.bash
source ~/ros_build_ws/groovy/setup.bash

#export ROS_PACKAGE_PATH=~/ros_catkin_ws/groovy/src:~/ros_build_ws/groovy:$ROS_PACKAGE_PATH
export ROS_PACKAGE_PATH=~/ros_build_ws/groovy:$ROS_PACKAGE_PATH
