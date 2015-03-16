#include <stdio.h>
#include <string.h>

#include "string_search.h"
#include "test.h"

void test_string_search_simple_search(void);
void test_string_search_simple_search_dijkstra_loop(void);

int main(void)
{
    printf("Testing...\n\n");

    printf("string_search_simple_search()\n");
    test_string_search_simple_search();

    printf("string_search_simple_search_dijkstra_loop()\n");
    test_string_search_simple_search_dijkstra_loop();

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
        string_search_simple_search("test", "qest"), strlen("test"), "test 05"
    );
}

void test_string_search_simple_search_dijkstra_loop(void)
{
    test_assert_equal_size_t(
        string_search_simple_search_dijkstra_loop("test", "test"),  0, "test 01"
    );

    test_assert_equal_size_t(
        string_search_simple_search_dijkstra_loop("test",  "est"),  1, "test 02"
    );
    
    test_assert_equal_size_t(
        string_search_simple_search_dijkstra_loop("test",   "st"),  2, "test 03"
    );
    
    test_assert_equal_size_t(
        string_search_simple_search_dijkstra_loop("test", "t"   ),  0, "test 04"
    );
    
    test_assert_equal_size_t(
        string_search_simple_search_dijkstra_loop("test", "qest"), strlen("test"), "test 05"
    );
}