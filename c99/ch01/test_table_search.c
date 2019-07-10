#include <stdio.h>
#include <string.h>

#include "table_search.h"
#include "test.h"

void test_table_search_search(void);

int main(void)
{
    printf("Testing...\n\n");

    printf("table_search_search()\n");
    test_table_search_search();

    return 0;
}

void test_table_search_search(void)
{
    #define COUNT 5
    const char* table[COUNT] = { "best", "fest", "guest", "test", "wriest" };

    test_require_equal_size_t(
        table_search_search(table, COUNT, "chest"), COUNT, "test 01"
    );

    test_require_equal_size_t(
        table_search_search(table, COUNT, "best"), 0, "test 02"
    );

    test_require_equal_size_t(
        table_search_search(table, COUNT, "test"), 3, "test 03"
    );

    test_require_equal_size_t(
        table_search_search(table, COUNT, "wriest"), 4, "test 04"
    );

    test_require_equal_size_t(
        table_search_search(table, COUNT, "wries"), COUNT, "test 05"
    );
}
