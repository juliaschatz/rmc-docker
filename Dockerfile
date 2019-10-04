FROM ros:melodic-ros-core

WORKDIR /app

# Setup ROS requirements

RUN apt-get update && apt-get install -y ros-melodic-can-msgs \
ros-melodic-controller-manager \
ros-melodic-cv-bridge \
ros-melodic-effort-controllers \
ros-melodic-gazebo-msgs \
ros-melodic-gazebo-plugins \
ros-melodic-gazebo-ros \
ros-melodic-gazebo-ros-control \
ros-melodic-joint-state-controller \
ros-melodic-joy \
ros-melodic-move-base \
ros-melodic-nav-core \
ros-melodic-robot-localization \
ros-melodic-robot-state-publisher \
ros-melodic-rviz-imu-plugin \
ros-melodic-socketcan-bridge \
ros-melodic-socketcan-interface \
ros-melodic-tf2 \
ros-melodic-tf2-ros \
ros-melodic-velocity-controllers \
ros-melodic-image-geometry \
ros-melodic-xacro \
ros-melodic-roslint \
ros-melodic-joint-state-publisher

# Setup ArUco library
RUN apt-get update && apt-get install -y ros-melodic-image-geometry
ADD https://sourceforge.net/projects/aruco/files/3.1.4/aruco-3.1.4.zip/download /aruco.zip
RUN cd / && unzip /aruco.zip
RUN mkdir /aruco-3.1.4/build
RUN cd /aruco-3.1.4/build && cmake .. && make && make install