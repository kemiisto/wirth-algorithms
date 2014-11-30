program test_search

    use search
    use test

    implicit none

    integer, dimension(1000) :: random_array
    integer :: i
    real :: temp
    type(search_result) :: result
    real :: start_time, finish_time

    print *, "Testing..."

    print *, "========================================"
    print *, "search_linear_search()"
    print *, "========================================"

    call test_compare( search_linear_search([3, 7, 4, 0, 0, 8, 1, 2, 1, 10],  0),  4, "Test 01" )
    call test_compare( search_linear_search([3, 7, 4, 0, 0, 8, 1, 2, 1, 10],  1),  7, "Test 02" )
    call test_compare( search_linear_search([3, 7, 4, 0, 0, 8, 1, 2, 1, 10],  5), 11, "Test 03" )

    print *, "========================================"
    print *, "search_binary_search()"
    print *, "========================================"

    ! Note that simple binary search algorithm is not guaranteed to find the first occurrence
    ! of the value in array.
    result = search_binary_search([0, 0, 1, 1, 2, 3, 4, 7, 8, 10],  0)
    call test_compare( result%found, .true., "Test 01a" )
    call test_compare( result%index, 2, "Test 01b" )

    result = search_binary_search([0, 0, 1, 1, 2, 3, 4, 7, 8, 10],  1)
    call test_compare( result%found, .true., "Test 02a" )
    call test_compare( result%index, 3, "Test 02b" )

    print *, "Benchmarking..."
    call random_seed()
    do i = 1, size(random_array)
        call random_number(temp)
        random_array(i) = 1 + floor(1000 * temp)
    end do

    call cpu_time(start_time)
    i = search_linear_search(random_array, 5)
    call cpu_time(finish_time)
    print *, i
    print *, random_array(i)
    print '("Time = ", f6.3, " seconds.")', finish_time - start_time

    call cpu_time(start_time)
    ! sort array
    result = search_binary_search(random_array, 5)
    call cpu_time(finish_time)
    print *, result%found
    print *, result%index
    print '("Time = ", f6.3, " seconds.")', finish_time - start_time

end program test_search
