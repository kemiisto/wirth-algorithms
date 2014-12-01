#include "test.h"

#include <stdio.h>

void print_passed_message(const char* description);
void print_failed_message(const char* description);

void test_assert_equal_size_t(size_t actual, size_t expected, 
    const char* description)
{
    if (actual == expected) {
        print_passed_message(description);
    } else {
        print_failed_message(description);
        printf("     actual: %zu\n", actual);
        printf("   expected: %zu\n", expected);  
    }
}

void print_passed_message(const char* description)
{
    printf("|- %s passed.\n", description);
}

void print_failed_message(const char* description)
{
    printf("|- %s failed.\n", description);
}
