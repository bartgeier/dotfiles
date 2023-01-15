#!/usr/bin/env python3

# install it with => sudo cp xmod /usr/local/bin/xtea.py

import sys
from ctypes import c_uint32


def encipher(v, k):
    y = c_uint32(v[0])
    z = c_uint32(v[1])
    sum = c_uint32(0)
    delta = 0x9e3779b9
    n = 32
    w = [0, 0]
    while (n > 0):
        sum.value += delta
        y.value += (((z.value << 4) + k[0]) ^ (z.value+sum.value)) ^ ((z.value >> 5) + k[1])
        z.value += (((y.value << 4) + k[2]) ^ (y.value+sum.value)) ^ ((y.value >> 5) + k[3])
        n -= 1
    w[0] = y.value
    w[1] = z.value
    return w


def decipher(v, k):
    y = c_uint32(v[0])
    z = c_uint32(v[1])
    sum = c_uint32(0xc6ef3720)
    delta = 0x9e3779b9
    n = 32
    w = [0, 0]
    while (n > 0):
        z.value -= (((y.value << 4) + k[2]) ^ (y.value+sum.value)) ^ ((y.value >> 5) + k[3])
        y.value -= (((z.value << 4) + k[0]) ^ (z.value+sum.value)) ^ ((z.value >> 5) + k[1])
        sum.value -= delta
        n -= 1
    w[0] = y.value
    w[1] = z.value
    return w


def encode(string, key):
    vector = [ord(x) for x in string]
    secret = []
    i = 0
    for _ in range(len(vector) // 2):
        v = vector[i:i+2]
        secret = secret + encipher(v, key)
        i = i + 2
    if len(vector) % 2 == 1:
        secret = secret + [vector[-1]+key[3]]
    return secret


def decode(secret, key):
    rest = len(secret) % 2
    vector = []
    i = 0
    for _ in range(int(len(secret) - rest) // 2):
        v = secret[i:i+2]
        vector = vector + decipher(v, key)
        i = i + 2
    if rest == 1:
        vector = vector + [secret[-1]-key[3]]
    string = ''.join(chr(x) for x in vector)
    return string


def test_encipher_decipher():
    key = [1, 2, 3, 4]
    v = [1385482523, 639876499]
    secret = encipher(v, key)
    print(f"v: {v}")
    print(f"secret: {secret}")
    if v[0] == decipher(secret, key)[0] and v[1] == decipher(secret, key)[1]:
        print("test_encipher_decipher => OK")
    else:
        print("test_encipher_decipher => FAIL")


def test_decipher():
    key = [1, 2, 3, 4]
    secret = [3349449178, 1799649188]
    print(f"key: {key}")
    print(f"secret: {secret}")
    x = decipher(secret, key)
    if 1385482523 == x[0] and 639876499 == x[1]:
        print("test_decipher => OK")
    else:
        print("test_decipher => FAIL")
    print(f"deciphered: {x}")


def test_encode_decode_0():
    key = [1234, 892, 3, 4]  # key size has to be 4 uint32_t
    str = 'Hello world 🙂'
    secret = encode(str, key)
    if str == decode(secret, key):
        print('test_encode_decode_0 => OK')
    else:
        print('test_encode_decode_0 => FAIL')
    print(decode(secret, key))
    print(secret)


def test_encode_decode_1():
    # key size has to be 4 uint32_t
    key = [2802116239, 3661675230, 1810895124, 447663303]
    str = 'ftp://ftp_noventa:Jugofalagaru29!@185.37.75.153/c1_sw-version_logs/'
    secret = encode(str, key)
    if str == decode(secret, key):
        print('test_encode_decode_1 => OK')
    else:
        print('test_encode_decode_1 => FAIL')
    print(decode(secret, key))
    print(secret)


def help():
    print('😰 help!')
    print('python3 xtea.py -h => help')
    print('python3 xtea.py -u => unittests')
    print("python3 xtea.py Hello World 🙂  => I'll encode it!")


def output_matrix(secret, numOfRow):
    for idx in range(len(secret)):
        print(secret[idx], end=',')
        if ((idx+1) % numOfRow) == 0:
            print("")
    print('\n};')


if __name__ == "__main__":
    if len(sys.argv) == 1   \
      or sys.argv[1] == '-h'   \
      or sys.argv[1] == '-help' \
      or sys.argv[1] == '--help':
        help()
    elif sys.argv[1] == '-u':
        test_encipher_decipher()
        print()
        test_decipher()
        print()
        test_encode_decode_0()
        print()
        test_encode_decode_1()
        print()
    else:
        str = ' '.join(sys.argv[1:])
        # key size has to be 4 uint32_t
        key = [1810895124, 2802116239, 3661675230, 447663303]
        secret = encode(str, key)
        print(f'/*python3 xtea.py {str}*/')
        s = ','.join(x.__str__() for x in key)
        print(f"std::array<uint32_t, {len(key)}> const key = {{ {s} }};")
        print('std::vector<uint32_t> const secret = {')
        output_matrix(secret, 7)
