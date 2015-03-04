add_executable(test_search search.c test_search.c ../test.c)
add_executable(bench_search search.c bench_search.c ../util.c)

add_executable(test_table_search table_search.c test_table_search.c ../test.c)

add_executable(test_string_search string_search.c test_string_search.c ../test.c)
