cmake_minimum_required(VERSION 2.8)
project(wirth_algorithms)
enable_language(Fortran)

if("${CMAKE_Fortran_COMPILER_ID}" STREQUAL "GNU")
    set(DEBUG_FLAGS -O0)
    set(RELEASE_FLAGS -O2)
    set(STANDARD_FLAGS -std=f2003 -pedantic-errors)
    # -Wall currently includes (as of GCC 4.9.2)
    # -Waliasing
    # -Wampersand
    # -Wc-binding-type
    # -Wconversion
    # -Wintrinsic-shadow
    # -Wintrinsics-std
    # -Wline-truncation
    # -Wno-tabs
    # -Wreal-q-constant
    # -Wsurprising
    # -Wtarget-lifetime
    # -Wunused

    # -Wextra currently includes (as of GCC 4.9.2)
    # -Wcompare-reals
    # -Wunused-parameter
    set(WARNING_FLAGS -Wall -Wextra -Werror
        -Warray-temporaries
        -Wcharacter-truncation
        -Wconversion-extra
        -Wimplicit-interface
        -Wimplicit-procedure
        -Wunderflow
        -fbounds-check
        -fbacktrace
        -ffpe-trap=zero
        -fimplicit-none
        -fmax-errors=1)
endif()

foreach(FLAG ${STANDARD_FLAGS} ${WARNING_FLAGS})
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${FLAG}")
endforeach()

foreach(FLAG ${DEBUG_FLAGS})
    set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} ${FLAG}")
endforeach()

foreach(FLAG ${RELEASE_FLAGS})
    set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} ${FLAG}")
endforeach()

message(STATUS "CMAKE_Fortran_FLAGS: ${CMAKE_Fortran_FLAGS}")

add_subdirectory(ch01)
