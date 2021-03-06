module search


  implicit none

  private

  public :: search_linear_search, search_binary_search, search_binary_search_alt


contains


  ! Tries to find an element equal to x in an integer array a.
  ! Return an index of such element counting from 0 or size(a) if it has not been found.
  ! If a contains several elements equal to x, then returns the index of the first occurrence.
  pure function search_linear_search(a, x) result(result)
    integer, dimension(0:), intent(in) :: a
    integer, intent(in) :: x
    integer :: result

    integer :: i, n

    i = 0
    n = size(a)

    do while (i < n)
      if (a(i) == x) exit
      i = i + 1
    end do

    result = i
  end function search_linear_search


  ! Tries to find an element equal to x in an integer array a.
  ! Return an index of such element counting from 0 or size(a) if it has not been found.
  pure function search_binary_search(a, x) result(result)
    integer, dimension(0:), intent(in) :: a
    integer, intent(in) :: x
    integer :: result

    integer :: n, l, r, m

    n = size(a)
    result = n ! not found

    l = 0
    r = n - 1
    m = (l + r) / 2

    do while (l <= r)
      if (a(m) == x) exit
      if (a(m) < x) then
        l = m + 1
      else
        r = m - 1
      end if
      m = (l + r) / 2
    end do

    if (l <= r) result = m
  end function search_binary_search


  ! Tries to find an element equal to x in an integer array a.
  ! Return an index of such element counting from 0 or size(a) if it has not been found.
  ! If a contains several elements equal to x, then returns the index of the first occurrence.
  pure function search_binary_search_alt(a, x) result(result)
    integer, dimension(0:), intent(in) :: a
    integer, intent(in) :: x
    integer :: result

    integer :: n, l, r, m

    n = size(a)
    result = n ! not found

    l = 0
    r = n
    
    do while (l < r)
      m = (l + r) / 2
      if (a(m) < x) then
        l = m + 1
      else
        r = m
      end if
    end do

    if (r < n) then
      if (a(r) == x) result = r
    end if
  end function search_binary_search_alt


end module search
