#include "string_search.h"

#include <stdbool.h>
#include <string.h>

size_t string_search_simple_search(const char* string, const char* substring)
{
    int n = strlen(string);
    int m = strlen(substring);

    int i = 0;
    int j = 0;
    
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
        return -1;
    } else {
        return i;
    }
}
