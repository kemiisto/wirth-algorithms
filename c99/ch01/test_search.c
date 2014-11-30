#include <stdio.h>

#include "search.h"

void test_search_linear_search(void);

int main(void)
{
	printf("Testing...\n\n");

	printf("search_linear_search()\n");
	test_search_linear_search();

	return 0;
}

void test_search_linear_search(void)
{
	int array[] = { 8, 7, 0, 6, 4, 0, 5, 5, 7, 9 };
}