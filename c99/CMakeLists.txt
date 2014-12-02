cmake_minimum_required(VERSION 2.8)
project(wirth_algorithms)

if("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang")
    set(DEBUG_FLAGS -O0)
    set(RELEASE_FLAGS -O2)
    set(STANDARD_FLAGS -std=c99 -pedantic-errors)
    set(WARNING_FLAGS -Wall -Wextra -Werror
        -Wbad-function-cast
        -Wcast-align
        -Wcast-qual
        -Wfloat-equal
        -Wformat=2
        -Winline
        -Wlogical-op-parentheses
        -Wmissing-prototypes
        -Wnested-externs
        -Wno-missing-braces
        -Wold-style-definition
        -Wpointer-arith
        -Wredundant-decls
        -Wshadow
        -Wstrict-aliasing=2
        -Wstrict-overflow=5
        -Wstrict-prototypes
        -Wswitch-default
        -Wswitch-enum
        -Wundef
        -Wunreachable-code
        -ferror-limit=1)
elseif("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
    set(DEBUG_FLAGS -O0)
    set(RELEASE_FLAGS -O2)
    set(STANDARD_FLAGS -std=c99 -pedantic-errors)
    set(WARNING_FLAGS -Wall -Wextra -Werror
        -Wbad-function-cast
        -Wcast-align
        -Wcast-qual
        -Wfloat-equal
        -Wformat=2
        -Winline
        -Wlogical-op
        -Wmissing-prototypes
        -Wnested-externs
        -Wno-missing-braces
        -Wold-style-definition
        -Wpointer-arith
        -Wredundant-decls
        -Wshadow
        -Wstrict-aliasing=2
        -Wstrict-overflow=5
        -Wstrict-prototypes
        -Wswitch-default
        -Wswitch-enum
        -Wundef
        -Wunreachable-code
        -fmax-errors=1)
elseif("${CMAKE_C_COMPILER_ID}" STREQUAL "Intel")
    if(WIN32)
        set(DEBUG_FLAGS /O0)
        set(RELEASE_FLAGS /O2)
        set(STANDARD_FLAGS /Qstd=c99)
        set(WARNING_FLAGS /Wall /Wcheck /WX
            /Wformat
            /Wmissing-declarations
            /Wmissing-prototypes
            /Wpointer-arith
            /Wreturn-type
            /Wshadow
            /Wsign-compare
            /Wstrict-prototypes
            /Wtrigraphs
            /Wuninitialized
            /Wunused-function
            /Wunused-variable)
    else()
        set(DEBUG_FLAGS -O0)
        set(RELEASE_FLAGS -O2)
        set(STANDARD_FLAGS -std=c99)
        set(WARNING_FLAGS -Wall -Wcheck -Werror
            -Wformat
            -Wmissing-declarations
            -Wmissing-prototypes
            -Wpointer-arith
            -Wreturn-type
            -Wshadow
            -Wsign-compare
            -Wstrict-prototypes
            -Wtrigraphs
            -Wuninitialized
            -Wunused-function
            -Wunused-variable)
    endif()
elseif("${CMAKE_C_COMPILER_ID}" STREQUAL "MSVC")
    set(DEBUG_FLAGS /Od)
    set(RELEASE_FLAGS /O2)
    set(STANDARD_FLAGS )
    set(WARNING_FLAGS /Wall /WX)
elseif("${CMAKE_C_COMPILER_ID}" STREQUAL "PGI")
    set(DEBUG_FLAGS -O0)
    set(RELEASE_FLAGS -O2)
    set(STANDARD_FLAGS -c99)
    set(WARNING_FLAGS -Minform=warn)
endif()

foreach(FLAG ${STANDARD_FLAGS} ${WARNING_FLAGS})
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${FLAG}")
endforeach()

foreach(FLAG ${DEBUG_FLAGS})
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} ${FLAG}")
endforeach()

foreach(FLAG ${RELEASE_FLAGS})
    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} ${FLAG}")
endforeach()

message(STATUS "${CMAKE_C_FLAGS}")

include_directories(${CMAKE_SOURCE_DIR})

if(MINGW)
    add_definitions(-D__USE_MINGW_ANSI_STDIO=1)
endif(MINGW)

add_subdirectory(ch01)
