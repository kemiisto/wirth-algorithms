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

  print *, ""
  print *, "search_binary_search_alt()"
  call test_search_binary_search_alt()

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
    call test_assert_equal( search_linear_search(array,  1), 10, "test 01" )
    call test_assert_equal( search_linear_search(array,  2), 10, "test 02" )
    call test_assert_equal( search_linear_search(array,  3), 10, "test 03" )

    ! existing unique elements 4, 6, 8, 9
    call test_assert_equal( search_linear_search(array,  4),  4, "test 04" )
    call test_assert_equal( search_linear_search(array,  6),  3, "test 05" )
    call test_assert_equal( search_linear_search(array,  8),  0, "test 06" )
    call test_assert_equal( search_linear_search(array,  9),  9, "test 07" )

    ! existing non-unique elements 0, 5, 7
    call test_assert_equal( search_linear_search(array,  0),  2, "test 08" )
    call test_assert_equal( search_linear_search(array,  5),  6, "test 09" )
    call test_assert_equal( search_linear_search(array,  7),  1, "test 10" )
  end subroutine test_search_linear_search


  subroutine test_search_binary_search()
    integer, dimension(10) :: array

    array = [0, 0, 4, 5, 5, 6, 7, 7, 8, 9]
    ! non-existing elements 1, 2, 3
    call test_assert_equal( search_binary_search(array,  1), 10, "test 01" )
    call test_assert_equal( search_binary_search(array,  2), 10, "test 02" )
    call test_assert_equal( search_binary_search(array,  3), 10, "test 03" )

    ! existing unique elements 4, 6, 8, 9
    call test_assert_equal( search_binary_search(array,  4),  2, "test 04" )
    call test_assert_equal( search_binary_search(array,  6),  5, "test 05" )
    call test_assert_equal( search_binary_search(array,  8),  8, "test 06" )
    call test_assert_equal( search_binary_search(array,  9),  9, "test 07" )

    ! existing non-unique elements 0, 5, 7
    ! call test_assert_equal( search_binary_search(array,  0),  0, "test 08" )
    ! call test_assert_equal( search_binary_search(array,  5),  3, "test 09" )
    ! call test_assert_equal( search_binary_search(array,  7),  6, "test 10" )
  end subroutine test_search_binary_search


  subroutine test_search_binary_search_alt()
    integer, dimension(10) :: array

    array = [0, 0, 4, 5, 5, 6, 7, 7, 8, 9]
    ! non-existing elements 1, 2, 3
    call test_assert_equal( search_binary_search_alt(array,  1), 10, "test 01" )
    call test_assert_equal( search_binary_search_alt(array,  2), 10, "test 02" )
    call test_assert_equal( search_binary_search_alt(array,  3), 10, "test 03" )

    ! existing unique elements 4, 6, 8, 9
    call test_assert_equal( search_binary_search_alt(array,  4),  2, "test 04" )
    call test_assert_equal( search_binary_search_alt(array,  6),  5, "test 05" )
    call test_assert_equal( search_binary_search_alt(array,  8),  8, "test 06" )
    call test_assert_equal( search_binary_search_alt(array,  9),  9, "test 07" )

    ! existing non-unique elements 0, 5, 7
    call test_assert_equal( search_binary_search_alt(array,  0),  0, "test 08" )
    call test_assert_equal( search_binary_search_alt(array,  5),  3, "test 09" )
    call test_assert_equal( search_binary_search_alt(array,  7),  6, "test 10" )
  end subroutine test_search_binary_search_alt


end program test_search
