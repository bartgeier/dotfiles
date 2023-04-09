#ifndef XTEA_H
#define XTEA_H

#include <vector>
#include <array>
#include <stdint.h>
#include <string>

std::string XTEA_decode(
        std::vector<uint32_t> secret,
        std::array<uint32_t,4> key
);


/* only for unitest public */
std::array<uint32_t, 2> decipher(
        std::array<uint32_t, 2> v,
        std::array<uint32_t, 4> key
) ;

#endif
