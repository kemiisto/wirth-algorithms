#include "search.h"

size_t search_linear_search(const int* a, size_t n, int x)
{
    size_t i = 0;
    
    while (i < n && a[i] != x) {
        i++;
    }

    return i;
}

size_t search_binary_search(const int* a, size_t n, int x)
{
    // can not use unsigned type for l and r due to wrap around semantics, i.e.
    // in the specific case when all elements in array are < x,
    // l stays 0 through the while loop and will always be <= r 
    // that will be decreasing to 0 but will never became negative
    long l = 0;
    long r = n - 1;
    long m = (l + r) / 2;
    
    while (l <= r && a[m] != x) {
        if (a[m] < x) {
            l = m + 1;
        } else {
            r = m - 1;
        }
        m = (l + r) / 2;
    }

    return l > r ? n : m;
}

size_t search_binary_search_alt(const int* a, size_t n, int x)
{
    size_t l = 0;
    size_t r = n;
    size_t m;

    while (l < r) {
        m = (l + r) / 2;
        if (a[m] < x) {
            l = m + 1;
        } else {
            r = m;
        }
    }

    return r < n && a[r] == x ? r : n;
}
