module search

    implicit none

    private

    public :: search_linear_search, search_binary_search

contains

    ! http://en.wikipedia.org/wiki/Short-circuit_evaluation
    ! Fortran standard does not specify are logical operators short-circuit or eager.
    ! The language specification allows the compiler to select the method for optimization
    pure function search_linear_search(array, value) result(i)
        integer, dimension(:), intent(in) :: array
        integer, intent(in) :: value
        integer :: i

        integer :: n

        n = size(array)
        i = 1
        do while ( i <= n )
            if ( array(i) == value ) exit
            i = i + 1
        end do
    end function search_linear_search

    pure function search_binary_search(array, value) result(r)
        integer, dimension(:), intent(in) :: array
        integer, intent(in) :: value
        integer :: m

        integer :: n, l, r

        n = size(array)
        l = 1
        r = n
        do while (l < r)
            m = (l + r) / 2
            if (array(m) < value) then
                l = m + 1
            else
                r = m
            end if
        end do

        if (array(r) /= value) r = n
    end function search_binary_search

end module search