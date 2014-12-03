#include <stdio.h>

#include "string_search.h"
#include "test.h"

void test_string_search_simple_search(void);

int main(void)
{
    printf("Testing...\n\n");

    printf("string_search_simple_search()\n");
    test_string_search_simple_search();

    return 0;
}

void test_string_search_simple_search(void)
{
    test_assert_equal_size_t(
        string_search_simple_search("test", "test"),  0, "test 01"
    );

    test_assert_equal_size_t(
        string_search_simple_search("test",  "est"),  1, "test 02"
    );
    
    test_assert_equal_size_t(
        string_search_simple_search("test",   "st"),  2, "test 03"
    );
    
    test_assert_equal_size_t(
        string_search_simple_search("test", "t"   ),  0, "test 04"
    );
    
    test_assert_equal_size_t(
        string_search_simple_search("test", "qest"), -1, "test 05"
    );
}
