module string_search

  implicit none

  private

  public :: string_search_simple_search,              &
        string_search_simple_search_dijkstra_loop

contains

  pure function r(string, pattern, i) result(matched)
    character(len=*), intent(in) :: string
    character(len=*), intent(in) :: pattern
    integer, intent(in) :: i
    logical :: matched

    integer :: m, j

    m = len(pattern)
    j = 1;
    do while (j <= m)
      if (pattern(j:j) /= string(i+j-1:i+j-1)) exit
      j = j + 1
    end do

    matched = .not. (j <= m)
  end function r

  pure function string_search_simple_search(string, pattern) result(i) 
    character(len=*), intent(in) :: string
    character(len=*), intent(in) :: pattern
    integer :: i

    integer :: m, n
    
    n = len(string)
    m = len(pattern)
    i = 1;
    do while (i <= n - m + 1)
      if (r(string, pattern, i)) exit
      i = i + 1
    end do
    
    if (i > n - m + 1) i = n + 1
  end function string_search_simple_search

  pure function string_search_simple_search_dijkstra_loop(string, pattern) result(i) 
    character(len=*), intent(in) :: string
    character(len=*), intent(in) :: pattern
    integer :: i

    integer :: j, m, n
    
    n = len(string)
    m = len(pattern)
    i = 1;
    j = 1;
    do while (.true.)
      if (i <= n - m + 1) then
        if (j <= m) then
          if (pattern(j:j) == string(i+j-1:i+j-1)) then
            j = j + 1
          else 
            i = i + 1
            j = 1
          end if
        else
          exit
        end if
      else
        exit
      end if
    end do
    
    if (i > n - m + 1) i = n + 1
  end function string_search_simple_search_dijkstra_loop

end module string_search
