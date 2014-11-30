module debug

    implicit none

    private

    public :: debug_assert

contains

    pure subroutine debug_assert(expression)
        logical, intent(in) :: expression

        real, volatile :: r

        r = 1.0
        if (.not. expression) r = r / 0.0
    end subroutine debug_assert

end module debug