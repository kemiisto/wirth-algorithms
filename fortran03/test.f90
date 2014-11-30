module test

    implicit none

    private

    public :: test_assert_equal, test_assert_equal_real

    interface test_assert_equal
        module procedure test_assert_equal_integer
        module procedure test_assert_equal_logical
        module procedure test_assert_equal_integer_array_1d
        module procedure test_assert_equal_character_array_1d
    end interface test_assert_equal

contains

    subroutine test_assert_equal_integer(actual, expected, description)
        integer, intent(in) :: actual
        integer, intent(in) :: expected
        character(len=*), intent(in) :: description

        if (actual == expected) then
            print *, "|- " // description // " passed."
        else
            print *, "|- " // description // " failed."
            print *, "     actual:", actual
            print *, "   expected:", expected  
        end if
    end subroutine test_assert_equal_integer

    ! From Knuth D.E. The art of computer programming (vol II).
    ! |a - b| / |a| <= e and |a - b| / |b| <= e
    subroutine test_assert_equal_real(actual, expected, tolerance, description)
        real, intent(in) :: actual
        real, intent(in) :: expected
        real, intent(in) :: tolerance
        character(len=*), intent(in) :: description

        real :: diff

        diff = actual - expected
        if ( abs(diff) / abs(actual) <= tolerance .and. abs(diff) / abs(expected) <= tolerance ) then
            print *, "|- " // description // " passed."
        else
            print *, "|- " // description // " failed."
            print *, "     actual:", actual
            print *, "   expected:", expected  
        end if
    end subroutine test_assert_equal_real

    subroutine test_assert_equal_logical(actual, expected, description)
        logical, intent(in) :: actual
        logical, intent(in) :: expected
        character(len=*), intent(in) :: description

        if (actual .eqv. expected) then
            print *, "|- " // description // " passed."
        else
            print *, "|- " // description // " failed."
            print *, "     actual:", actual
            print *, "   expected:", expected  
        end if
    end subroutine test_assert_equal_logical

    subroutine test_assert_equal_integer_array_1d(actual, expected, description)
        integer, dimension(:), intent(in) :: actual
        integer, dimension(:), intent(in) :: expected
        character(len=*), intent(in) :: description

        if (all(actual == expected)) then
            print *, "|- " // description // " passed."
        else
            print *, "|- " // description // " failed."
            print *, "     actual:", actual
            print *, "   expected:", expected  
        end if
    end subroutine test_assert_equal_integer_array_1d

    subroutine test_assert_equal_character_array_1d(actual, expected, description)
        character, dimension(:), intent(in) :: actual
        character, dimension(:), intent(in) :: expected
        character(len=*), intent(in) :: description

        if (all(actual == expected)) then
            print *, "|- " // description // " passed."
        else
            print *, "|- " // description // " failed."
            print *, "     actual:", actual
            print *, "   expected:", expected  
        end if
    end subroutine test_assert_equal_character_array_1d

end module test
