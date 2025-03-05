import time

def minimax_value(state):
    piles, turn = state
    
    if all(p == 0 for p in piles):
        return 1 if turn == 1 else -1
    
    newMoves = next_moves(piles)
    
    if turn == 1:
        best_value = -float('inf')
        for new_piles in newMoves:
            value = minimax_value((new_piles, 2))
            best_value = max(best_value, value)
    else:
        best_value = float('inf')
        for new_piles in newMoves:
            value = minimax_value((new_piles, 1))
            best_value = min(best_value, value)
    
    return best_value

def next_moves(piles):
    moves = []
    for i, pile in enumerate(piles):
        for takeOff in range(3,0,-1):
            new_piles = list(piles)
            if (new_piles[i] - takeOff) >= 0:
                new_piles[i] = new_piles[i]-takeOff
                new_piles.sort()
                if new_piles not in moves: moves.append(new_piles)
    return moves

def test_timing(state):
    start = time.time()
    value = minimax_prune(state)
    end = time.time()
    duration = end-start
    return duration, value


visited = {}
def minimax_prune(state):
    visited.clear()
    piles, turn = state
    value = maxPrune(state, -float('inf'), float('inf')) if turn == 1 else minPrune(state, -float('inf'), float('inf'))
    return value

def maxPrune(state, alpha, beta):
    piles, turn = state
    if all (p==0 for p in piles):
        return 1

    bestValue = -float('inf')
    nextMoves = next_moves(piles)
    for move in nextMoves:
        value = minPrune((move,2),alpha,beta)
        bestValue = max(bestValue, value)
        if bestValue >= beta:
            return bestValue
        alpha = max(bestValue,alpha)
    return bestValue



def minPrune(state, alpha, beta):
    piles, turn = state
    if all (p==0 for p in piles):
        return -1

    bestValue = float('inf')
    nextMoves = next_moves(piles)
    for move in nextMoves:
        value = maxPrune((move,1),alpha,beta)
        bestValue = min(bestValue, value)
        if bestValue >= alpha:
            return bestValue
        beta = min(bestValue,alpha)
    return bestValue

#print("Testing minimax_value: 8,8 2")
#output = (test_timing(([8,8],2)))
#print("Time taken", output[0])
#print("Value returned", output[1])


def test():
    print("Testing minimax_value: 8,8 2")
    output = (test_timing(([8,8],2)))
    print("Time taken", output[0])
    print("Value returned", output[1])
    print("--------------------")
    print("Testing minimax_value: 6,4,2,3 1")
    output = (test_timing(([6,4,2,3],1)))
    print("Time taken", output[0])
    print("Value returned", output[1])
    print("--------------------")
    print("Testing minimax_value: 20,20 1")
    output = (test_timing(([20,20],1)))
    print("Time taken", output[0])
    print("Value returned", output[1])
    print("--------------------")
    print("Testing minimax_value: 10,10,10 2")
    output = (test_timing(([10,10,10],2)))
    print("Time taken", output[0])
    print("Value returned", output[1])
    print("--------------------")
    print("Testing minimax_value: 5,5,5 1")
    output = (test_timing(([5,5,5],1)))
    print("Time taken", output[0])
    print("Value returned", output[1])
    print("--------------------")
    print("Testing minimax_value: 2,2 2")
    output = (test_timing(([2,2],2)))
    print("Time taken", output[0])
    print("Value returned", output[1])
    print("--------------------")


#test()
#print("Testing minimax_value: 5,5 1")
#output = test_timing(([5, 5], 1))
#print("Time taken", output[0])
#print("Value returned", output[1])
#
#print("\nTesting minimax_value: 5,5 1")
#output = test_timing(([5, 5, 5], 2))
#print("Time taken", output[0])
#print("Value returned", output[1])
#
#print("\nTesting minimax_value: 9,20,20,20,20 1")
#output = test_timing(([9, 20, 20, 20, 20], 1))
#print("Time taken", output[0])
#print("Value returned", output[1])
#
#print("\nTesting minimax_value: 8,8 2")
#output = test_timing(([8, 8], 2))
#print("Time taken", output[0])
#print("Value returned", output[1])
##
#print("\nTesting minimax_value: 4 1")
#output = test_timing(([4], 1))
#print("Time taken", output[0])
#print("Value returned", output[1])
#
#print("\nTesting minimax_value: 6,4,2,3 1")
#output = test_timing(([6, 4, 2, 3], 1))
#print("Time taken", output[0])
#print("Value returned", output[1])
## #
#print("\nTesting minimax_value: 20,20 1")
#output = test_timing(([20, 20], 1))
#print("Time taken", output[0])
#print("Value returned", output[1])
##
#print("\nTesting minimax_value: 10,10,10 2")
#output = test_timing(([10, 10, 10], 2))
#print("Time taken", output[0])
#print("Value returned", output[1])
##
#print("\nTesting minimax_value: 8,3,2 1")
#output = test_timing(([8, 3, 2], 1))
#print("Time taken", output[0])
#print("Value returned", output[1])
#
#print("\nTesting minimax_value: 8,8,8 1")
#output = test_timing(([8, 8, 8], 1))
#print("Time taken", output[0])
#print("Value returned", output[1])
#
#print("\nTesting minimax_value: 2,2 1")
#output = test_timing(([2, 2], 1))
#print("Time taken", output[0])
#print("Value returned", output[1])
#
#print("\nTesting minimax_value: 5,5,5 1")
#output = test_timing(([5, 5, 5], 1))
#print("Time taken", output[0])
#print("Value returned", output[1])