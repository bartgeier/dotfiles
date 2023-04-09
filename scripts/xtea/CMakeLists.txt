cmake_minimum_required(VERSION 3.1)

project(xtea LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

function(print)
        foreach(var ${ARGN})
                message("${var} = ${${var}}")
        endforeach()
endfunction()

function(print_env)
        foreach(var ${ARGN})
                message("${var} = $ENV{${var}}")
        endforeach()
endfunction()

print(PROJECT_NAME)
print_env(PATH)


add_subdirectory(src)
add_subdirectory(unitTests)


