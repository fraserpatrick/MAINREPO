def diag(string):
    for i in range(len(string)):
        print(" " * i + string[i])


def collatz(n):
    output = [n]
    while n != 1:
        if n % 2 == 0:
            n = n // 2
        else:
            n = 3 * n + 1
        output.append(n)
    return len(output)


def biggest_seq(end):
    longestSeq = 0
    longestIndex = 0
    for n in range(1,end+1):
        seq = collatz(n)
        if longestSeq < seq:
            longestSeq = seq
            longestIndex = n
    return longestIndex, longestSeq


def has_aaa(string):
    string = string.lower()
    if "aaa" in string:
        return True
    else: 
        return False


def make_bunch(high, low, green, budget):
    highs = 0
    lows = 0
    greens = 4
    budget -= 2
    if green < 4:
        return []
    if budget > 0:
        while budget >= 4 and highs < 4 and highs < high:
            budget -= 4
            highs += 1
        while budget >= 2 and lows < low:
            budget -= 2
            lows += 1
        while budget >= 0.5 and greens < green:
            budget -= 0.5
            greens += 1
        if budget ==0:
            return [highs, lows, greens]
    return []


def test():
    diag("hello world")
    print(collatz(12))
    seqN, seqL = biggest_seq(35000)
    print("Value of N = " + str(seqN))
    print("Length = " + str(seqL))
    print(has_aaa("TesaAAAst"))
    print(make_bunch(4, 1, 6, 21))


test()