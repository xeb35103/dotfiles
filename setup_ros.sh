# ROS
export ROS_DISTRO=melodic

# ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install ros-${ROS_DISTRO}-desktop-full 
source /opt/ros/${ROS_DISTRO}/setup.bash
echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo rosdep init
rosdep update

# catkin
sudo apt install python-catkin-tools
source /opt/ros/${ROS_DISTRO}/setup.bash
mkdir -p ~/ros_catkin_ws/${ROS_DISTRO}/src

cd ~/ros_catkin_ws/${ROS_DISTRO}
catkin build
source devel/setup.bash

#catkin init

#rosdep install --from-paths src --ignore-src -r -y



