module test

    implicit none

    private

    public :: test_compare, test_compare_reals

    interface test_compare
        module procedure test_compare_integer_integer 
        module procedure test_compare_logical_logical
        module procedure test_compare_integer_array_integer_array_1d
        module procedure test_compare_character_array_character_array_1d
    end interface test_compare

contains

    subroutine test_compare_integer_integer(actual, expected, description)
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
    end subroutine test_compare_integer_integer

    ! From Knuth D.E. The art of computer programming (vol II).
    ! |a - b| / |a| <= e and |a - b| / |b| <= e
    subroutine test_compare_reals(actual, expected, tolerance, description)
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
    end subroutine test_compare_reals

    subroutine test_compare_logical_logical(actual, expected, description)
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
    end subroutine test_compare_logical_logical

    subroutine test_compare_integer_array_integer_array_1d(actual, expected, description)
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
    end subroutine test_compare_integer_array_integer_array_1d

    subroutine test_compare_character_array_character_array_1d(actual, expected, description)
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
    end subroutine test_compare_character_array_character_array_1d

end module test
