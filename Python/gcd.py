a = int(input("A: "))
b = int(input("B: "))
gcd = 0

while True:
    if a == b:
        gcd = a
        print("A: ",a,"B: ",b,"GCD: ",gcd)
        break
    elif a > b:
        print("A: ",a,"B: ",b)
        a = a-b
    elif a < b:
        print("A: ",a,"B: ",b)
        b = b-a
