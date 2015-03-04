#ifndef TEST_H
#define TEST_H

#include <stddef.h>

void test_assert_equal_size_t(size_t actual, size_t expected, 
    const char* description);
void test_assert_equal_int(int actual, int expected, 
    const char* description);

#endif // TEST_H
