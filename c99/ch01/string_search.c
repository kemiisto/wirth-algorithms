#include "string_search.h"

#include <stdbool.h>
#include <string.h>

size_t string_search_simple_search(const char* string, const char* substring)
{
    size_t n = strlen(string);
    size_t m = strlen(substring);

    size_t i = 0;
    size_t j = 0;
    
    while (true) {
        if (i <= n - m && j < m && string[i+j] == substring[j]) {
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
