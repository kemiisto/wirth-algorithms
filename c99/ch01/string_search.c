#include "string_search.h"

#include <stdbool.h>
#include <string.h>

bool r(const char* string, const char* pattern, size_t i);

size_t string_search_simple_search(const char* string, const char* pattern)
{
    size_t n = strlen(string);
    size_t m = strlen(pattern);

    size_t i = 0;
    while (i <= n - m && !r(string, pattern, i)) {
        i++;
    }

    if (i > n - m) {
        return n;
    } else {
        return i;
    }
}

bool r(const char* string, const char* pattern, size_t i)
{
    size_t m = strlen(pattern);

    size_t j = 0;
    while (j < m && pattern[j] == string[i + j]) {
        j++;
    }

    return !(j < m);
}

size_t string_search_simple_search_dijkstra_loop(const char* string, const char* pattern)
{
    size_t n = strlen(string);
    size_t m = strlen(pattern);

    size_t i = 0;
    size_t j = 0;
    
    while (true) {
        if (i <= n - m && j < m && string[i + j] == pattern[j]) {
            j++;
        } else if (i <= n - m && j < m) {
            i++;
            j = 0;
        } else {
            break;
        }
    }

    if (i > n - m) {
        return n;
    } else {
        return i;
    }
}
