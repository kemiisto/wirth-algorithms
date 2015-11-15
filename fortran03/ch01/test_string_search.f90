program test_string_search

  use string_search
  use test

  implicit none

  print *, "Testing..."

  print *, ""
  print *, "string_search_simple_search()"
  call test_string_search_simple_search()

  print *, ""
  print *, "string_search_simple_search_dijkstra_loop()"
  call test_string_search_simple_search_dijkstra_loop()
  
contains

  subroutine test_string_search_simple_search()

    call test_assert_equal(                                              &
      string_search_simple_search("test", "test"), 1, "test 01"          &
    )

    call test_assert_equal(                                              &
      string_search_simple_search("test",  "est"), 2, "test 02"          &
    )
    
    call test_assert_equal(                                              &
      string_search_simple_search("test",   "st"), 3, "test 03"          &
    )
    
    call test_assert_equal(                                              &
      string_search_simple_search("test", "t"   ), 1, "test 04"          &
    )
    
    call test_assert_equal(                                              &
      string_search_simple_search("test", "qest"), 5, "test 05"          &
    )

  end subroutine test_string_search_simple_search
    
  subroutine test_string_search_simple_search_dijkstra_loop()

    call test_assert_equal(                                              &
      string_search_simple_search_dijkstra_loop("test", "test"), 1,      &
        "test 01"                                                        &
    )

    call test_assert_equal(                                              &
      string_search_simple_search_dijkstra_loop("test",  "est"), 2,      &
        "test 02"                                                        &
    )
    
    call test_assert_equal(                                              &
      string_search_simple_search_dijkstra_loop("test",   "st"), 3,      &
        "test 03"                                                        &
    )
    
    call test_assert_equal(                                              &
      string_search_simple_search_dijkstra_loop("test", "t"   ), 1,      &
        "test 04"                                                        &
    )
    
    call test_assert_equal(                                              &
      string_search_simple_search_dijkstra_loop("test", "qest"), 5,      &
        "test 05"                                                        &
    )

  end subroutine test_string_search_simple_search_dijkstra_loop

end program test_string_search
