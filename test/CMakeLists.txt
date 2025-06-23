cmake_minimum_required(VERSION 3.12)
project(test_test LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE "Debug")

include(FetchContent)
FetchContent_Declare(
        googletest
        GIT_REPOSITORY  https://github.com/google/googletest.git
        GIT_TAG         52eb8108c5bdec04579160ae17225d66034bd723
        GIT_SHALLOW     TRUE
)
FetchContent_MakeAvailable(googletest)

file(GLOB_RECURSE test_src_list
        "src/*.cpp"
)

add_executable(test_test ${test_src_list})
target_link_libraries(test_test
        PRIVATE
        CALC
        GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(test_test)
target_compile_options(test_test PRIVATE -Wall -Wextra -Werror)