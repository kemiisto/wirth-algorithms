module search

  implicit none

  private

  public :: search_linear_search, search_binary_search

contains

  ! Tries to find an element equal to value in an integer array.
  ! Return an index of such element counting from 1 
  ! or 0 if it has not been found.
  ! If the array contains several elements equal to value,
  ! then returns the index of the first occurrence.
  pure function search_linear_search(array, value) result(i)
    integer, dimension(:), intent(in) :: array
    integer, intent(in) :: value
    integer :: i

    integer :: n

    i = 1
    n = size(array)

    do while (i <= n)
      if (array(i) == value) exit
      i = i + 1
    end do

    if (i > n) i = 0
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

    if (array(r) /= value) r = 0
  end function search_binary_search

end module search
