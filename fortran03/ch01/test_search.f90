program test_search

  use search
  use test

  implicit none

!    integer :: i
!    real :: temp
!    real :: start_time, finish_time

  print *, "Testing..."

  print *, ""
  print *, "search_linear_search()"
  call test_search_linear_search()

  print *, ""
  print *, "search_binary_search()"
  call test_search_binary_search()

!    print *, "Benchmarking..."
!    call random_seed()
!    do i = 1, size(random_array)
!        call random_number(temp)
!        random_array(i) = 1 + floor(1000 * temp)
!    end do

!    call cpu_time(start_time)
!    print *, search_linear_search(random_array, 5)
!    call cpu_time(finish_time)
!    print '("Time = ", f6.3, " seconds.")', finish_time - start_time

!    call cpu_time(start_time)
!    ! sort array
!    print *, search_binary_search(random_array, 5)
!    call cpu_time(finish_time)
!    print '("Time = ", f6.3, " seconds.")', finish_time - start_time

contains

  subroutine test_search_linear_search()
    integer, dimension(10) :: array

    array = [8, 7, 0, 6, 4, 0, 5, 5, 7, 9]
    ! non-existing elements 1, 2, 3
    call test_assert_equal( search_linear_search(array,  1),  0, "test 01" )
    call test_assert_equal( search_linear_search(array,  2),  0, "test 02" )
    call test_assert_equal( search_linear_search(array,  3),  0, "test 03" )

    ! existing unique elements 4, 6, 8, 9
    call test_assert_equal( search_linear_search(array,  4),  5, "test 04" )
    call test_assert_equal( search_linear_search(array,  6),  4, "test 05" )
    call test_assert_equal( search_linear_search(array,  8),  1, "test 06" )
    call test_assert_equal( search_linear_search(array,  9), 10, "test 07" )

    ! existing non-unique elements 0, 5, 7
    call test_assert_equal( search_linear_search(array,  0),  3, "test 08" )
    call test_assert_equal( search_linear_search(array,  5),  7, "test 09" )
    call test_assert_equal( search_linear_search(array,  7),  2, "test 10" )
  end subroutine test_search_linear_search

  subroutine test_search_binary_search()
    integer, dimension(10) :: array

    array = [0, 0, 4, 5, 5, 6, 7, 7, 8, 9]
    ! non-existing elements 1, 2, 3
    call test_assert_equal( search_linear_search(array,  1),  0, "test 01" )
    call test_assert_equal( search_linear_search(array,  2),  0, "test 02" )
    call test_assert_equal( search_linear_search(array,  3),  0, "test 03" )

    ! existing unique elements 4, 6, 8, 9
    call test_assert_equal( search_linear_search(array,  4),  3, "test 04" )
    call test_assert_equal( search_linear_search(array,  6),  6, "test 05" )
    call test_assert_equal( search_linear_search(array,  8),  9, "test 06" )
    call test_assert_equal( search_linear_search(array,  9), 10, "test 07" )

    ! existing non-unique elements 0, 5, 7
    call test_assert_equal( search_linear_search(array,  0),  1, "test 08" )
    call test_assert_equal( search_linear_search(array,  5),  4, "test 09" )
    call test_assert_equal( search_linear_search(array,  7),  7, "test 10" )
  end subroutine test_search_binary_search

end program test_search
