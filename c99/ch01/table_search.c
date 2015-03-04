#include "table_search.h"

size_t table_search_search(const char** table, size_t count, const char* value)
{
    size_t l = 0;
    size_t r = count - 1;
    size_t m;
    size_t i = -1;
    
    while (l < r) {
        m = (l + r) / 2;
        i = 0;
        while (value[i] != '\0' && table[m][i] == value[i]) {
            ++i;
        }
        if (table[m][i] < value[i]) {
            l = m + 1;
        } else {
            r = m;
        }   
    }

    if (r < count) {
        i = 0;
        while (value[i] != '\0' && table[r][i] == value[i]) {
            ++i;
        }
    }
    
    return (table[r][i] != value[i] ? count : r);
}
