#ifndef SEARCH_H
#define SEARCH_H

#include <stddef.h>

// Tries to find an element equal to value in an integer array.
// Return an index of such element or count if it has not been found.
// If the array contains several elements equal to value,
// then returns the index of the first occurrence.
size_t search_linear_search(const int* a, size_t n, int x);

// Tries to find an element equal to value in a sorted integer array.
// Return an index of such element or count if it has not been found.
// If the array is not sorted in ascending order the behavior is undefined.
size_t search_binary_search(const int* a, size_t n, int x);

// If the array contains several elements equal to value,
// then returns the index of the first occurrence.
size_t search_binary_search_alt(const int* a, size_t n, int x);

#endif // SEARCH_H


