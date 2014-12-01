#include <stdio.h>

#include "search.h"
#include "test.h"

void test_search_linear_search(void);
void test_search_binary_search(void);

int main(void)
{
    printf("Testing...\n\n");

    printf("search_linear_search()\n");
    test_search_linear_search();

    printf("\nsearch_binary_search()\n");
    test_search_binary_search();

    return 0;
}

void test_search_linear_search(void)
{
    const int array[] = { 8, 7, 0, 6, 4, 0, 5, 5, 7, 9 };

    // non-existing elements 1, 2, 3
    test_assert_equal_size_t(search_linear_search(array, 10, 1), 10, "test 01");
    test_assert_equal_size_t(search_linear_search(array, 10, 2), 10, "test 02");
    test_assert_equal_size_t(search_linear_search(array, 10, 3), 10, "test 03");

    // existing unique elements 4, 6, 8, 9
    test_assert_equal_size_t(search_linear_search(array, 10, 4),  4, "test 04");
    test_assert_equal_size_t(search_linear_search(array, 10, 6),  3, "test 05");
    test_assert_equal_size_t(search_linear_search(array, 10, 8),  0, "test 06");
    test_assert_equal_size_t(search_linear_search(array, 10, 9),  9, "test 07");

    // existing non-unique elements 0, 5, 7
    test_assert_equal_size_t(search_linear_search(array, 10, 0),  2, "test 08");
    test_assert_equal_size_t(search_linear_search(array, 10, 5),  6, "test 09");
    test_assert_equal_size_t(search_linear_search(array, 10, 7),  1, "test 10");
}

void test_search_binary_search(void)
{
    const int array[] = { 0, 0, 4, 5, 5, 6, 7, 7, 8, 9 };

    // non-existing elements 1, 2, 3
    test_assert_equal_size_t(search_binary_search(array, 10, 1), 10, "test 01");
    test_assert_equal_size_t(search_binary_search(array, 10, 2), 10, "test 02");
    test_assert_equal_size_t(search_binary_search(array, 10, 3), 10, "test 03");

    // existing unique elements 4, 6, 8, 9
    test_assert_equal_size_t(search_binary_search(array, 10, 4),  2, "test 04");
    test_assert_equal_size_t(search_binary_search(array, 10, 6),  5, "test 05");
    test_assert_equal_size_t(search_binary_search(array, 10, 8),  8, "test 06");
    test_assert_equal_size_t(search_binary_search(array, 10, 9),  9, "test 07");

    // existing non-unique elements 0, 5, 7
    test_assert_equal_size_t(search_binary_search(array, 10, 0),  0, "test 08");
    test_assert_equal_size_t(search_binary_search(array, 10, 5),  3, "test 09");
    test_assert_equal_size_t(search_binary_search(array, 10, 7),  6, "test 10");
}
