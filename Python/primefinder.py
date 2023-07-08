n = 500933
primes = []
valid = True

while True:
    print(n)
    for i in range(n):
        if (n%(i+1)) == 0:
            if i+1 != 1 and i+1 != n:
                valid = False



    if valid == True:
        primes.append(n)
        f = open("primenumbers.txt", "a")
        fileinput = str(n) + ", "
        f.write(fileinput)
        f.close()

    n = n+1
    valid = True
    print("PRIMES",primes)
