file(GLOB SOURCES ../*.f90)
add_executable(test_search search.f90 test_search.f90 ${SOURCES})
add_executable(test_string_search string_search.f90 test_string_search.f90 ${SOURCES})
add_executable(test_table_search table_search.f90 test_table_search.f90 ${SOURCES})
