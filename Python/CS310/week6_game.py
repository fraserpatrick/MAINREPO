import random
from minMax import nextMoves, minimax_prune

# Main function to run game
def Nim():
    # initial variables
    initialState = []
    state = ()

    print("Let's play Nim")

    # Add try catch to ensure only valid values are accepted
    valid = False
    while valid==False:
        try:
            # Get piles and sticks
            numPiles = input("How many piles initially? ")
            maxSticks = input("Maximum number of sticks? ")

            # Create initial state
            for i in range(int(numPiles)):
                # Use random numbers to generate random number of sticks
                sticks = random.randint(1,int(maxSticks))
                initialState.append(sticks)

            # set first or second go and create state
            print("The intial state is " + str(initialState))
            print("Do you want to play a) first or b) second")
            turn = input("Enter a or b: ")
            if(str(turn).lower() ==  "a"):
                state = (initialState,1) #user is always MAX player
                valid = True

            elif(str(turn).lower() == "b"):
                state = (initialState,2) #AI is always MIN player
                valid = True

            else:
                raise ValueError("Invalid Input")
        except ValueError:
            print("invalid input, please re-enter")

    # Return state so we can start game
    return state


# THe user turn, let them choose
def userturn(state):
    # Next states called here (import from your own code)
    newMoves = nextMoves(state)
    # if only an empty state left, pick the stick and return to save time

    # Print list of moves and use "input" to get keyboard input
    print("------Your move------")
    for i in range(len(newMoves)):
        print("Option " + str(i+1) + ": ", newMoves[i][0])
    selected = input("Which option would you like to play: ")
    while int(selected) > len(newMoves) or int(selected) < 1:
        print("Invalid option")
        selected = input("Which option would you like to play: ")
    state = newMoves[int(selected)-1]
    print("You moved to:", state[0])

    # Set new state and return
    return state

def AI_player_basic(state):
    print("------AI move------")
    state = minimax_prune(state)[1]
    print("AI moved to:", state[0])
    return state


def AI_player_rollout(state):
    maxDepth = 3
    print("------AI move------")
    value,bestmove = minPruneRollout(state,{},float("-inf"), float("inf"),0,maxDepth)
    print("AI moved to:",bestmove[0])
    return bestmove

def maxPruneRollout(state,visited,alpha,beta,depth,maxDepth):
    piles,turn = state
    if len(piles) == 0:
        return -1, None  # No move possible
    
    if depth > maxDepth:
        return evalRollout(state),None
    
    value = float("-inf")
    best_move = None
    
    newStates = nextMoves(state)
    for newState in newStates:
        newPiles, newTurn = newState
        newKey = (tuple(newPiles), newTurn)
        already_calculated = newKey in visited
        m, _ = (
            minPruneRollout(newState, visited, alpha, beta,depth+1,maxDepth)
            if not already_calculated
            else (visited[newKey], None)
        )

        if m > value:
            value = m
            best_move = newState  # Store the best move

        if value >= beta:
            return value, best_move
        alpha = max(alpha, value)

    stateKey = (tuple(piles), turn)
    if stateKey not in visited:
        visited[stateKey] = value

    return value,best_move

def minPruneRollout(state,visited,alpha,beta,depth,maxDepth):
    piles,turn = state
    if len(piles) == 0:
        return -1, None
    
    if depth > maxDepth:
        return evalRollout(state),None
    
    value = float("inf")
    best_move = None
    
    newStates = nextMoves(state)
    for newState in newStates:
        newPiles, newTurn = newState
        newKey = (tuple(newPiles), newTurn)
        already_calculated = newKey in visited
        m, _ = (
            maxPruneRollout(newState, visited, alpha, beta,depth+1,maxDepth)
            if not already_calculated
            else (visited[newKey], None)
        )

        if m < value:
            value = m
            best_move = newState  # Store the best move

        if value <= alpha:
            return value, best_move
        beta = min(beta, value)

    stateKey = (tuple(piles), turn)
    if stateKey not in visited:
        visited[stateKey] = value

    return value,best_move


def evalRollout(state):
    wins = 0
    losses = 0
    sims = 100

    for i in range(sims):
        simResult = simGames(state)
        if simResult == 1:
            wins += 1
        else:
            losses += 1
    return (wins - losses) / sims

def simGames(state):
    while state[0] != []:
        newMoves = nextMoves(state)
        if not newMoves:
            return -1 if state[1] == 1 else 1
        state = random.choice(newMoves)
    return -1 if state[1] == 1 else 1

# Given a state, start the game
def game_begin(state):

    game_state = state

    print("game start ", game_state)
    # while no winner, keep alternating
    while game_state[0] != []:

        # You will need to create your own AI function
        if(game_state[1]==1):
            game_state = userturn(game_state)
        else:
            game_state = AI_player_rollout(game_state)
        print("\nState is", game_state)

    # if final state is 1, 2 wins
    if(game_state[1] == 2):
        print("You lose!")
    else:
        print("You win!")


# Game, get state
init_state = Nim()
game_begin(init_state)
