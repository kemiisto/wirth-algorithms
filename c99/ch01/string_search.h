#ifndef STRING_SEARCH_H
#define STRING_SEARCH_H

#include <stddef.h>

// Tries to find a substring in a string.
// Return an index of such element or count if it has not been found.
// If the array contains several elements equal to value,
// then returns the index of the first occurrence.
size_t string_search_simple_search(const char* string, const char* substring);
size_t string_search_simple_search_dijkstra_loop(const char* string, const char* pattern);

#endif // STRING_SEARCH_H
