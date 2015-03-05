module table_search

    implicit none

    private

    public :: table_search_search

contains

    pure function table_search_search(table, value) result(r)
        character(len=*), dimension(0:), intent(in) :: table
        character(len=*), intent(in) :: value
        integer :: m
        integer :: i

        integer :: count, l, r

        count = size(table)
        l = 0
        r = count - 1

        do while (l < r)
            m = (l + r) / 2
            i = 1
            do while (i <= len(value))
                if (table(m)(i:i) /= value(i:i)) exit
                i = i + 1
            end do
            ! When strings table(m) and value are equal, i at the end of 
            ! the inner while cycle will be one greater than the string length.
            ! Then we have to compare the ith characters of the strings,
            ! which is fine for null-teminated strings (they both have 
            ! null-character at their ends), but will cause out-of-bounds error
            ! for Fortran strings which are not null-teminated.
            ! In such a case we have to spep one element back first.
            if (i > len(value)) i = i - 1

            if (table(m)(i:i) < value(i:i)) then
                l = m + 1
            else
                r = m
            end if
        end do

        if (r < count) then
            i = 1
            do while (i <= len(value))
                if (table(r)(i:i) /= value(i:i)) exit
                i = i + 1
            end do
        end if
        if (i > len(value)) i = i - 1

        if (table(r)(i:i) /= value(i:i)) r = count
    end function table_search_search

end module table_search