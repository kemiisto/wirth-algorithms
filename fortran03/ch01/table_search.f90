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
        i = -1
        do while (l < r)
            m = (l + r) / 2
            i = 1
            do while (value(i:i) /= '\0' .and. table(m)(i:i) == value(i:i))
                i = i + 1
            end do
            if (table(m)(i:i) < value(i:i)) then
                l = m + 1
            else
                r = m
            end if
        end do

        if (r < count) then
            i = 1
            do while (value(i:i) /= '\0' .and. table(r)(i:i) == value(i:i))
                i = i + 1
            end do
        end if

        if (table(r)(i:i) /= value(i:i)) r = count
    end function table_search_search

end module table_search