# clone source
mkdir -p ~/ros_catkin_ws/${ROS_DISTRO}/src/ROBOTIS-GIT
cd ~/ros_catkin_ws/${ROS_DISTRO}/src/ROBOTIS-GIT
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_gazebo_plugin.git

# environment
export TURTLEBOT3_MODEL=burger

# catkin build
cd ~/ros_catkin_ws/${ROS_DISTRO}
catkin build

# 
export GAZEBO_PLUGIN_PATH=~/ros_catkin_ws/${ROS_DISTRO}/src/ROBOTIS-GIT/turtlebot3_gazebo_plugin/build:${GAZEBO_PLUGIN_PATH}
export GAZEBO_MODEL_PATH=~/ros_catkin_ws/${ROS_DISTRO}/src/ROBOTIS-GIT/turtlebot3_gazebo_plugin/models:~/catkin_ws/.gazebo/models:${GAZEBO_MODEL_PATH}

# run simulator in each terminal

# basic
roscore
roslaunch turtlebot3_gazebo turtlebot3_world.launch
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
roslaunch turtlebot3_gazebo turtlebot3_gazebo_rviz.launch

#
roslaunch turtlebot3_bringup turtlebot3_robot.launch

