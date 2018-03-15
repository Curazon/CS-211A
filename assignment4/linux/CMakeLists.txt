cmake_minimum_required(VERSION 3.9)
project(cs211a_hw4)

set(CMAKE_CXX_STANDARD 11)

add_executable(hw4 main.cpp mymath.h transforms.cpp transforms.h)

find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)
find_package(GLEW REQUIRED)

include_directories(${OPENGL_INCLUDE_DIRS} ${GLUT_INCLUDE_DIRS} ${GLEW_INCLUDE_DIRS} /usr/include)
target_link_libraries(hw4 ${OPENGL_LIBRARIES} ${GLUT_LIBRARY} ${GLEW_LIBRARIES})


#---

find_package(GTest REQUIRED)

include_directories(${GTEST_INCLUDE_DIRS})
add_executable(runTests tests.cpp transforms.cpp transforms.h)
target_link_libraries(runTests ${GTEST_LIBRARIES} pthread)
