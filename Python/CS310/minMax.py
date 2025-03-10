import time

def test_timing(state):
    start = time.time()
    value = minimax_prune(state)
    end = time.time()
    duration = end-start
    return duration, value


def minimax_prune(state):
    piles, turn = state
    if turn == 1:
        value = maxPrune(state, {}, float("-inf"), float("inf"))
    else:
        value = minPrune(state, {}, float("-inf"), float("inf"))
    return value


def nextMoves(state):
    new_piles = []
    piles, turn = state
    left = []
    right = list(piles)

    right.sort()

    while len(right) != 0:
        current = right.pop(0)
        for j in range(1, 4):
            if (current - j) <= 0:
                temp = tuple(left + right)
                if temp not in new_piles:
                    new_piles.append(tuple(left + right))
                break

            l = left + [current - j]
            l.sort()
            temp = tuple(l + right)
            if temp not in new_piles:
                new_piles.append(temp)

        left.append(current)

    return list(map(lambda p: (list(p), 1 if turn == 2 else 2), new_piles))


def maxPrune(state, visited, alpha, beta):
    piles, turn = state
    if len(piles) == 0:
        return 1

    value = float("-inf")

    newStates = nextMoves(state)
    for newState in newStates:
        newPiles, newTurn = newState
        newKey = (tuple(newPiles), newTurn)
        already_calcuated = newKey in visited
        m = (
            minPrune(newState, visited, alpha, beta)
            if not already_calcuated
            else visited[newKey]
        )

        value = max(value, m)
        if m >= beta:
            return value
        alpha = max(alpha, m)

    stateKey = (tuple(piles), turn)
    if stateKey not in visited:
        visited[stateKey] = value
    return value


def minPrune(state, visited, alpha, beta):
    piles, turn = state
    if len(piles) == 0:
        return -1

    value = float("inf")

    newStates = nextMoves(state)
    for newState in newStates:
        newPiles, newTurn = newState
        newKey = (tuple(newPiles), newTurn)
        already_calcuated = newKey in visited
        m = (
            maxPrune(newState, visited, alpha, beta)
            if not already_calcuated
            else visited[newKey]
        )

        value = min(value, m)
        if m <= alpha:
            return value
        beta = min(beta, m)

    stateKey = (tuple(piles), turn)
    if stateKey not in visited:
        visited[stateKey] = value
    return value


def test():
    print("Testing minimax_value: 8,8 2 =-1")
    output = (test_timing(([8,8],2)))
    print("Time taken", output[0])
    print("Value returned", output[1])
    print("--------------------")
    print("Testing minimax_value: 6,4,2,3 1=1")
    output = (test_timing(([6,4,2,3],1)))
    print("Time taken", output[0])
    print("Value returned", output[1])
    print("--------------------")
    print("Testing minimax_value: 20,20 1=1")
    output = (test_timing(([20,20],1)))
    print("Time taken", output[0])
    print("Value returned", output[1])
    print("--------------------")
    print("Testing minimax_value: 10,10,10 2=-1")
    output = (test_timing(([10,10,10],2)))
    print("Time taken", output[0])
    print("Value returned", output[1])
    print("--------------------")
    print("Testing minimax_value: 2,2 2=1")
    output = (test_timing(([2,2],2)))
    print("Time taken", output[0])
    print("Value returned", output[1])
    print("--------------------")


test()