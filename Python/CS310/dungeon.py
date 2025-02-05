# this is the variable to control room info
#nesw = [currentroom, northroom, eastroom, southroom, westroom, treasure(1/0), death(1/0), exit(1/0)]
#nesw = [8, 1, 1, 0, 1, 0, 0, 0]

#descs  - A list of descriptions for each room
descs = ["The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "You have fallen into the pit with no stairs!  Sadly, no escaping this one",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "You have reached a dead end.  The only way is back.",
         "The room looks empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "The room is empty.",
         "Nobody even knew this pit was here, better luck next time!.",
         "You have escaped!"
         ]

nesw = [[0, 0, 0, 3, 0, 0, 0, 0],
        [1, 0, 2, 4, 0, 0, 0, 0],
        [2, 0, 0, 5, 1, 0, 0, 0],
        [3, 1, 4, 7, 0, 0, 0, 0],
        [4, 1, 0, 8, 3, 0, 0, 0],
        [5, 2, 0, 0, 0, 0, 1, 0],
        [6, 0, 7, 11, 0, 0, 0, 0],
        [7, 3, 8, 0, 6, 0, 0, 0],
        [8, 4, 9, 13, 7, 0, 0, 0],
        [9, 0, 10, 14, 8, 0, 0, 0],
        [10, 0, 0, 15, 9, 0, 0, 0],
        [11, 6, 0, 16, 0, 0, 0, 0],
        [12, 0, 0, 17, 0, 0, 0, 0],
        [13, 8, 14, 0, 0, 1, 0, 0],
        [14, 9, 0, 0, 13, 0, 0, 0],
        [15, 10, 0, 20, 0, 0, 0, 0],
        [16, 11, 17, 24, 0, 0, 0, 0],
        [17, 12, 0, 21, 16, 0, 0, 0],
        [18, 0, 19, 22, 0, 0, 0, 0],
        [19, 0, 20, 23, 18,0, 0, 0],
        [20, 15, 0, 0, 19, 0, 0, 0],
        [21, 17, 22, 0, 0, 0, 0, 0],
        [22, 18, 0, 0, 21, 0, 0, 0],
        [23, 19, 0, 0, 0, 0, 1, 0],
        [24, 16, 0, 0, 0, 0, 0, 1]
        ]

def victory(info):
    print(" ______")
    print(" |    |")
    print(" |   O|")
    print(" |    |")
    print(" ______")

    print("Congratulations, you have escaped the dungeon!")
    global treas
    if(treas>0):
        print("  ")
        print(" And you found the fabulous treasure too, Excellent work!")


def next_room(choice):
    # appends the current room to the sequence and and loads the next room
    global seq
    seq.append(choice)

    global descs
    global nesw

    create_room(nesw[choice], descs[choice])

def move_options(info):
    # Function to list the options for a user to take
    if(info[6] == 0):
        print("Move: ", end="")
        if (info[1] > 0):
            print("N. North   ", end ="")
        if (info[2] > 0):
            print("E. East   ", end ="")
        if (info[3] > 0):
            print("S. South   ", end ="")
        if (info[4] > 0):
            print("W. West   ", end ="")


def get_option(nesw):
    # Function to allow user to make a choice

    finished = False

    while(finished==False):
        print("Enter a letter")
        user_input = input()
        print(user_input)

        if (user_input == "dig" or user_input == "Dig") and nesw[5] == 1:
            print("Found Fabulous treasure!!  Where now?")
            global treas
            treas = 1;
        elif (user_input == "dig" or user_input == "Dig") and nesw[5] == 0:
            print("Nothing to dig for here.  Where now?")
        else:
            #  Handle movement
            first_letter = user_input[0].lower()
            print("first letter " + first_letter)

            # Check North
            if(first_letter == "n" and nesw[1]> 0):
                finished = nesw[1];
                return nesw[1]
            elif (first_letter == "e" and nesw[2]>0):
                finished = True;
                return nesw[2]
            elif (first_letter == "s" and nesw[3]>0):
                finished = True;
                return nesw[3]
            elif (first_letter == "w" and nesw[4]>0):
                finished = True;
                return nesw[4]
            else:
                print("Unrecognised input, please input a letter")

def draw_room(info):
    # draw room
    if(info[1] >0):
        print(" _   _ ")
    else:
        print(" _ _ _ ")
    print("|     |")

    if(info[6]==0):
        # West door
        if (info[4] > 0):
            print("      ", end ="")
        else:
            print("|     ", end ="")
        # East door
        if (info[2] > 0):
            print(" ")
        else:
            print("|")

    else:
        print("| DEAD ")
    print("|     |")

    # draw south door
    if (info[3] > 0):
        print(" _   _ ")
    else:
        print(" _ _ _ ")


def create_room(info, description):
    # Room Config
    #print(info)

    #first thing, check if we won!
    if info[7] == 0:

        # Draw Room
        draw_room(info)

        # add description
        print(description)

        if(info[6]==0):
            # Add options
            move_options(info)

            # Get option
            choice = get_option(info)

            # Go to new room
            next_room(choice)
    else:
        # If we won
        victory(info)

#  Start game
first_room = 0
treas = 0
seq = [first_room]
create_room(nesw[first_room], descs[first_room])
print("You explored " + str(len(seq)) + " rooms and your sequence was: ")
print(seq)