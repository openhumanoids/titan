cmake_minimum_required(VERSION 3.5.1)
project(spartan)

enable_testing()

# Set default build type
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING
    "The type of build. Options are: Debug Release RelWithDebInfo MinSizeRel."
    FORCE)
endif()

# Build shared libraries by default
option(BUILD_SHARED_LIBS "Build shared libraries" ON)

# Set default install prefix
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" CACHE STRING
    "Prefix for installation of sub-packages (note: required during build!)"
    FORCE)
endif()

# Options
option(WITH_ATLAS_DRIVER "Build the proprietary Atlas drivers" OFF)


# Setup external projects
include(ExternalProject)
set_property(DIRECTORY PROPERTY EP_PREFIX ${CMAKE_BINARY_DIR})

# Gives FindDrake, FindEigen, and FindGFlags
list(INSERT CMAKE_MODULE_PATH 0 "${PROJECT_SOURCE_DIR}/cmake/modules")

ExternalProject_Add(drake
  GIT_REPOSITORY https://github.com/RobotLocomotion/drake.git
  GIT_TAG 666e27a166c74783385e6939576f04065424a64d
  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
    -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
    -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
    -DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
    -DCMAKE_VERBOSE_MAKEFILE=${CMAKE_VERBOSE_MAKEFILE}
  BINARY_DIR "${PROJECT_BINARY_DIR}/drake"
  BUILD_ALWAYS 1
  INSTALL_COMMAND :
)

ExternalProject_Add(director
  GIT_REPOSITORY https://github.com/RobotLocomotion/director.git
  GIT_TAG ca3aba94a39e75190ff6ea126478e7426fbcf88f
  CMAKE_CACHE_ARGS
    -DUSE_EXTERNAL_INSTALL:BOOL=ON
    -DDD_QT_VERSION:STRING=4
    -DUSE_DRAKE:BOOL=ON
    -DUSE_LCM:BOOL=ON
    -DUSE_LIBBOT:BOOL=ON
    -DUSE_SYSTEM_EIGEN:BOOL=ON
    -DUSE_SYSTEM_LCM:BOOL=ON
    -DUSE_SYSTEM_LIBBOT:BOOL=ON
    -DUSE_SYSTEM_VTK:BOOL=OFF
    -DUSE_PCL:BOOL=OFF
    -DUSE_APRILTAGS:BOOL=OFF
    -DUSE_OPENNI2_LCM:BOOL=OFF # don't build OPENNI2 driver, conflicts with openni2_launch in ROS
    -DUSE_PERCEPTION:BOOL=OFF
    ${CMAKE_ARGS_FOR_EXTERNALS}
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> <SOURCE_DIR>/distro/superbuild
  BINARY_DIR "${PROJECT_BINARY_DIR}/director"
  BUILD_ALWAYS 1
  INSTALL_COMMAND ""
  DEPENDS drake
)

ExternalProject_Add(pronto-distro
  GIT_REPOSITORY https://github.com/rdeits/pronto-distro
  GIT_TAG ee4beb17982a5e15a4d05f260579de6800375bd7
  BUILD_ALWAYS 1
  BUILD_IN_SOURCE 1
  PATCH_COMMAND git submodule update --init --recursive && echo "externals" > tobuild.txt && echo "pronto" >> tobuild.txt
  CONFIGURE_COMMAND ""
  BUILD_COMMAND "make"
  INSTALL_COMMAND ""
  )
