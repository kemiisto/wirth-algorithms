#include "util.h"

#include <stdlib.h>
#include <time.h>

int* util_random_int_array(size_t count, int min_value, int max_value)
{
    int* array = malloc(count * sizeof(int));
    srand(time(0));
    for (size_t i = 0; i < count; ++i) {
        array[i] = rand() % (max_value - min_value) + min_value;
    }
    return array;
}
