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


def next_states(string):
    output = []
    if len(string) == 0:
        return []
    
    if string[len(string)-1] == "I":
        output.append(string + "U")

    if string[0] == "M":
        output.append(string + string[1:])

    for i in range(len(string)-2):
        if string[i] == "I" and string[i+1] == "I" and string[i+2] == "I":
            output.append(string[:i] + "U" + string[i+3:])

    if "UU" in string:
        output.append(string.replace("UU",""))

    return output


def extend_path(path):
    output = []
    for state in next_states(path[len(path)-1]):
        output.append(path + [state])
    return output


def breadth_first_search(goal):
    currentPath = []
    agenda = [["MI"]]
    extendCount, agendaMaxLen = 0,0
    expansionLimit = 5000
    while expansionLimit > extendCount:
        agendaMaxLen = len(agenda)
        currentPath = agenda.pop(0)
        if currentPath[len(currentPath)-1] == goal:
            return currentPath, extendCount, agendaMaxLen
        newPaths = extend_path(currentPath)
        agenda += newPaths
        extendCount += 1
        
    return ["MI"], extendCount, agendaMaxLen



def test():
    diag("hello world")
    print(collatz(12))
    seqN, seqL = biggest_seq(35000)
    print("Value of N = " + str(seqN))
    print("Length = " + str(seqL))
    print(has_aaa("TesaAAAst"))
    print(make_bunch(4, 1, 6, 21))
    print(next_states("MI"))
    print(extend_path(["MI", "MII"]))
    breadthPath,breadthExpansions,breadthMax = breadth_first_search("MUIU")
    print("PATH: " + str(breadthPath))
    print("EXPANSIONS: " + str(breadthExpansions))
    print("MAX AGENDA: " + str(breadthMax))

test()