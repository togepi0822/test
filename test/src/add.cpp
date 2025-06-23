#include <calc/add.h>
#include <gtest/gtest.h>

TEST(add, usage) {
    ASSERT_EQ(0, calc::add(0, 0));
    ASSERT_EQ(false, calc::add(false, false));
    ASSERT_EQ(11.0, calc::add(3.3, 7.7));
}