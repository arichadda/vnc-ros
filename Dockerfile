FROM ros:noetic-ros-core

RUN apt-get -y update && apt-get install -y \
    curl

RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

RUN apt-get -y update && apt-get install -y \
    iputils-ping \
    net-tools \
    wget \
    screen \
    git \
    nano \
    vim \
    htop \
    ros-noetic-joy \
    ros-noetic-teleop-twist-joy \
    ros-noetic-teleop-twist-keyboard \ 
    ros-noetic-laser-proc \
    ros-noetic-rgbd-launch \
    ros-noetic-depthimage-to-laserscan \
    ros-noetic-rosserial-arduino \ 
    ros-noetic-rosserial-python \
    ros-noetic-rosserial-server \ 
    ros-noetic-rosserial-client \ 
    ros-noetic-rosserial-msgs \
    ros-noetic-amcl \
    ros-noetic-map-server \
    ros-noetic-move-base \
    ros-noetic-urdf \
    ros-noetic-xacro \
    ros-noetic-compressed-image-transport \
    ros-noetic-rqt-image-view \
    ros-noetic-gmapping \
    ros-noetic-navigation \
    ros-noetic-interactive-markers \
    ros-noetic-turtlebot3-gazebo \
    python3-catkin-tools \
    tmux \
    python3-pip 

RUN mkdir -p /root/catkin_ws/src
RUN pip install pandas==2.0.3 torch==1.13.1 numpy==1.23.2
WORKDIR /root/catkin_ws
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash"
RUN echo "source /opt/ros/noetic/setup.sh" >> /root/.bashrc
RUN echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc
RUN echo "defshell -bash" >> ~/.screenrc
RUN screen -d -m roscore
WORKDIR /root/catkin_ws/src/

