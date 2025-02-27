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
    value = minimax_value(state)
    end = time.time()
    duration = end-start
    return duration, value

def test():
    print("MINIMAX: " + str(minimax_value(([1,2],2))))
    output = (test_timing(([5,5,5],1)))
    print("Time taken", output[0])
    print("Value returned", output[1])

#test()

output = (test_timing(([5,5,5],1)))
print("Time taken", output[0])
print("Value returned", output[1])