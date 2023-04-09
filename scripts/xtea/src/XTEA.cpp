#include "XTEA.h"

std::string XTEA_decode(
        std::vector<uint32_t> secret,
        std::array<uint32_t, 4> key
) {
        int rest = secret.size() % 2;
        std::vector<uint32_t> vector;
        for (size_t i = 0; i < (secret.size()-rest); i += 2) {
                std::array<uint32_t, 2> const v = { secret[i], secret[i+1] };
                std::array<uint32_t, 2> const x = decipher(v, key);
                vector.push_back(x[0]);
                vector.push_back(x[1]);
        }
        if (rest == 1) {
                vector.push_back(secret.back()-key[3]);
        }
        std::string s;
        for (auto v : vector) {
                s += char(v);
        }
        return s;
}

std::array<uint32_t, 2> decipher(
        std::array<uint32_t, 2> v,
        std::array<uint32_t, 4> key
) {
        uint32_t y = v[0];
        uint32_t z = v[1];
        uint32_t sum = 0xc6ef3720;
        uint32_t delta = 0x9e3779b9;
        int n = 32;
        std::array<uint32_t, 2> w ={0, 0};
        while (n>0) {
                z -= (((y<<4) + key[2]) ^ (y+sum)) ^ ((y>>5) + key[3]);
                y -= (((z<<4) + key[0]) ^ (z+sum)) ^ ((z>>5) + key[1]);
                sum -= delta;
                n -= 1;
        }
        w[0] = y;
        w[1] = z;
        return w;
}
