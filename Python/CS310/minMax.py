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


def minimax_prune(state):
    return minimax(state, -float('inf'), float('inf'))

def minimax(state, alpha, beta):
        piles, turn = state
        if all(p == 0 for p in piles):
            return 1 if turn == 1 else -1

        return maxPrune(state, alpha, beta) if turn == 1 else minPrune(state, alpha, beta)

def maxPrune(state, alpha, beta):
    piles, turn = state
    best_value = -float('inf')
    newMoves = next_moves(piles)

    for new_piles in newMoves:
        value = minimax((new_piles, 2), alpha, beta)
        best_value = max(best_value, value)
        alpha = max(alpha, best_value)
        if beta <= alpha:
            break
    return best_value

def minPrune(state, alpha, beta):
    piles, turn = state
    best_value = float('inf')
    newMoves = next_moves(piles)

    for new_piles in newMoves:
        value = minimax((new_piles, 1), alpha, beta)
        best_value = min(best_value, value)
        beta = min(beta, best_value)
        if beta <= alpha:
            break
    return best_value


def test():
    output = (test_timing(([6,4,2,3],1)))
    print("Time taken", output[0])
    print("Value returned", output[1])

test()