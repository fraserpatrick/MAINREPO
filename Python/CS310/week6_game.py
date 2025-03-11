import random
import time
import math
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
            game_state = AI_player_basic(game_state)
        # game_state = AI_player_basic(game_state)
        print("\nState is", game_state)

    # if final state is 1, 2 wins
    if(game_state[1] == 2):
        print("You lose!")
    else:
        print("You win!")


# Game, get state
init_state = Nim()
game_begin(init_state)
