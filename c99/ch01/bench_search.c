#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "search.h"
#include "util.h"

int compare_ints(const void* a, const void* b);

int main(void)
{
    const size_t count = 100000000;
    const int min_value = 0;
    const int max_value = 9;

    int* array = util_random_int_array(count, min_value, max_value);
    
    clock_t start_time = clock();
    printf("%zu\n", search_linear_search(array, count, max_value + 1));
    clock_t end_time = clock();
    double duration = 1000.0 * (end_time - start_time) / CLOCKS_PER_SEC;
    printf("search_linear_search(unsorted array): %8.2f ms\n", duration);

    start_time = clock();
    qsort(array, count, sizeof(int), compare_ints);
    printf("%zu\n", search_binary_search(array, count, max_value + 1));
    end_time = clock();
    duration = 1000.0 * (end_time - start_time) / CLOCKS_PER_SEC;
    printf("search_binary_search(unsorted array): %8.2f ms\n", duration);

    start_time = clock();
    printf("%zu\n", search_linear_search(array, count, max_value + 1));
    end_time = clock();
    duration = 1000.0 * (end_time - start_time) / CLOCKS_PER_SEC;
    printf("search_linear_search(  sorted array): %8.2f ms\n", duration);

    start_time = clock();
    printf("%zu\n", search_binary_search(array, count, max_value + 1));
    end_time = clock();
    duration = 1000.0 * (end_time - start_time) / CLOCKS_PER_SEC;
    printf("search_binary_search(  sorted array): %8.2f ms\n", duration);

    free(array);

    return 0;
}

int compare_ints(const void* a, const void* b)
{
    const int *arg1 = a;
    const int *arg2 = b;
 
    return *arg1 - *arg2;
}
