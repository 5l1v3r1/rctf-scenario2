cmake_minimum_required(VERSION 3.5)
project(scenario2)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic -Wunused-parameter)
endif()

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

add_executable(stalker_rctf src/talker.cpp)
ament_target_dependencies(stalker_rctf rclcpp std_msgs)

add_executable(slistener_rctf src/listener.cpp)
ament_target_dependencies(slistener_rctf rclcpp std_msgs)

install(TARGETS
  stalker_rctf slistener_rctf
  DESTINATION lib/${PROJECT_NAME}
)

ament_package()
