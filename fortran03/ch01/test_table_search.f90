program test_table_search

    use table_search
    use test

    implicit none

    print *, "Testing..."

    print *, ""
    print *, "table_search_search()"
    call test_table_search_search()

contains

    subroutine test_table_search_search()
        character(len=6), dimension(5) :: table

        table = ["best  ", "fest  ", "guest ", "test  ", "wriest"]

        call test_assert_equal( table_search_search(table,  "chest" ), 5, "test 01" )
        call test_assert_equal( table_search_search(table,  "best"  ), 0, "test 02" )
        call test_assert_equal( table_search_search(table,  "test"  ), 3, "test 03" )
        call test_assert_equal( table_search_search(table,  "wriest"), 4, "test 04" )
        call test_assert_equal( table_search_search(table,  "wries" ), 5, "test 05" )
    end subroutine test_table_search_search

end program test_table_search