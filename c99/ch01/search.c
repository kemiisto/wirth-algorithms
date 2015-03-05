#include "search.h"

size_t search_linear_search(const int* array, size_t count, int value)
{
    size_t i = 0;
    
    while (i < count && array[i] != value) {
        i++;
    }

    return i;
}

size_t search_binary_search(const int* array, size_t count, int value)
{
    size_t l = 0;
    size_t r = count - 1;
    size_t m;
    
    while (l < r) {
        m = (l + r) / 2;
        if (array[m] < value) {
            l = m + 1;
        } else {
            r = m;
        }  
    }
    
    return (array[r] != value ? count : r);
}
