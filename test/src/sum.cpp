#include <calc/sum.h>
#include <gtest/gtest.h>

TEST(sum, usage) {
    ASSERT_EQ(11, calc::sum(true, 10));
    ASSERT_EQ(20.3f, calc::sum(false, 10, 0.3f, '\n'));
}