cmake_minimum_required(VERSION 2.8)
project(wirth_algorithms)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99 -pedantic-errors")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wbad-function-cast")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wcast-align")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wcast-qual")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wfloat-equal")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wformat=2")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Winline")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wmissing-prototypes")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wnested-externs")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-missing-braces")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wold-style-definition")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wpointer-arith")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wredundant-decls")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wshadow")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wstrict-aliasing=2")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wstrict-overflow=5")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wstrict-prototypes")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wswitch-default")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wswitch-enum")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wundef")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wunreachable-code")

if ("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wlogical-op-parentheses")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ferror-limit=1")
elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wlogical-op")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fmax-errors=1")
elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "Intel")
  # using Intel C++
elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "MSVC")
  # using Visual Studio C++
endif()


set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2 -march=native")

include_directories(${CMAKE_SOURCE_DIR})

if (MINGW)
    add_definitions(-D__USE_MINGW_ANSI_STDIO=1)
endif (MINGW)

add_subdirectory(ch01)
