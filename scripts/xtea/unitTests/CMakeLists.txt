add_library(
        unitTests
        _googleTestKit/gtest/gtest.h
        _googleTestKit/gtest-all.cpp
        xteaEncryption/test_XTEA.cpp
        )
 
target_include_directories(unitTests PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/_googleTestKit")
target_include_directories(unitTests PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/../src")

print(CMAKE_CURRENT_SOURCE_DIR)


add_executable(xtea-test _googleTestKit/gtest_main.cpp)
# target_include_directories(xtea-test PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(xtea-test PRIVATE src unitTests)
