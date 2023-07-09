def d2c(num):
    str = ""
    while (num != 0):
        str += chr( num % 26 + 64 )
        num //= 26
    return str[::-1]

def c2d(str):
    num = 0
    for i in str:
        num *= 26
        num += ord(i) - 64
    print(num)
    return num

c2d("PATR")
