import sys
from ctypes import *


def encipher(v, k):
    y = c_uint32(v[0])
    z = c_uint32(v[1])
    sum = c_uint32(0)
    delta = 0x9e3779b9
    n = 32
    w = [0,0]
    while(n>0):
        sum.value += delta
        y.value += ( z.value << 4 ) + k[0] ^ z.value + sum.value ^ ( z.value >> 5 ) + k[1]
        z.value += ( y.value << 4 ) + k[2] ^ y.value + sum.value ^ ( y.value >> 5 ) + k[3]
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
    w = [0,0]
    while(n>0):
        z.value -= ( y.value << 4 ) + k[2] ^ y.value + sum.value ^ ( y.value >> 5 ) + k[3]
        y.value -= ( z.value << 4 ) + k[0] ^ z.value + sum.value ^ ( z.value >> 5 ) + k[1]
        sum.value -= delta
        n -= 1
    w[0] = y.value
    w[1] = z.value
    return w


def encode(string, key):
    vector = [ ord(x) for x in string ]
    secret = []
    i = 0
    for _ in range(len(vector) // 2):
        v = vector[i:i+2]
        secret = secret + encipher(v, key)
        i = i + 2
    if len(vector) % 2 == 1:
        secret = secret + [vector[-1]]
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
         vector =  vector + [secret[-1]]
    string = ''.join(chr(x) for x in vector)
    return string


def test_encipher_decipher():
    key = [1,2,3,4]
    v = [1385482523,639876499]
    secret = encipher(v,key)
    if v[0] == decipher(secret,key)[0] and v[1] == decipher(secret,key)[1]:
        print("test_encipher_decipher => OK")
    else:
        print("test_encipher_decipher => FAIL")


def test_encode_decode():
    key = [1234,892,3,4] # key size has to be 4 uint32_t
    str = 'Hello world 🙂'
    secret = encode(str, key)
    if str == decode(secret, key):
        print('test_encode_decode => OK')
    else:
        print('test_encode_decode => FAIL')
    print(decode(secret, key))
    print(secret)


def help():
    print('😰 help!')
    print('python3 xtea.py -h => help') 
    print('python3 xtea.py -u => unittests') 
    print("python3 xtea.py Hello World 🙂  => I'll encode it!")


if __name__ == "__main__":
    if len(sys.argv) == 1   \
    or sys.argv[1] == '-h'   \
    or sys.argv[1] == '-help' \
    or sys.argv[1] == '--help':
        help()
    elif sys.argv[1] == '-u':
        test_encipher_decipher()
        test_encode_decode()
    else:
        str = ' '.join(sys.argv[1:])
        key = [2802116239,3661675230,1810895124,447663303] # key size has to be 4 uint32_t
        secret = encode(str,key)
        print(f'/* {str} */')
        s = ','.join(x.__str__() for x in key)
        print(f"uint32_t const key[{len(key)}] = {{ {s} }}")
        print(f'uint32_t const secret[{len(secret)}] = {{')
        idx = 0
        numOfRows = 7
        numOfLines = len(secret) // numOfRows + ((len(secret) % numOfRows) > 0)
        for _ in range(numOfLines):
            print('        ',end='')
            for x in secret[idx:idx+numOfRows]:
                print(x,end=',')
            print()
            idx = idx + 5
        print('};')
