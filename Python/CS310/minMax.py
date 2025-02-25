def minimax_value(state):
    temp = next_moves(state[0])
    print(temp)


    if all(p == 0 for p in state[0]):
        return -1 if state[1] == 1 else 1
    


    if state[1] == 1:
        maxMove(state)
    elif state[1] == 2:
        minMove(state)
    return 0

def maxMove(state):
    pass

def minMove(state):
    pass

def next_moves(piles):
    moves = []
    for i, pile in enumerate(piles):
        for takeOff in range(3,0,-1):
            new_piles = list(piles)
            if (new_piles[i] - takeOff) >= 0:
                new_piles[i] = new_piles[i]-takeOff
                moves.append(new_piles)
        
    return moves

def test():
    print("MINIMAX: " + str(minimax_value(([4],1))))

test()