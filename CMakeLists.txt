cmake_minimum_required(VERSION 3.31)
project(test LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(FETCHCONTENT_BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/third_party")

option(TEST_BUTTON "Build unit test" ${PROJECT_IS_TOP_LEVEL})

add_library(CALC INTERFACE)

target_include_directories(CALC INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/include)

if (TEST_BUTTON)
    enable_testing()
    add_subdirectory(test)
endif (TEST_BUTTON)
