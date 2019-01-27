FROM ros:crystal-ros-base-bionic

MAINTAINER Lander Usategui <lander@aliasrobotics.com>

# install ros2 packages
RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/*

COPY scenario2-local /root/ros2_ws/src/scenario2

RUN /bin/bash -c "cd /root/ros2_ws/ \
&& source /opt/ros/crystal/setup.bash \
&& colcon build --merge-install --install-base /opt/ros/crystal --packages-select scenario2 --cmake-args -DBUILD_TESTING=OFF \
&& cd && rm -r /root/ros2_ws"

RUN rm -rf /etc/update-motd.d/* && rm -rf /etc/legal && sed -i 's/\#force_color_prompt=yes/force_color_prompt=yes/' /root/.bashrc

COPY motd /etc/motd

COPY launch_script.bash /root/

RUN echo "cat /etc/motd" >> /root/.bashrc

ENTRYPOINT ["/root/launch_script.bash"]
