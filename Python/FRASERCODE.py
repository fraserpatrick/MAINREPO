mileages = []           #defines all variables as lists
chargersUsed = []
legMiles = []
legCosts = []

def getInputs():
    mileages.append(int(input("Enter starting mileage: ")))         #adds value to end of list
    mileages.append(int(input("Enter mileage at first stop: ")))
    checkInput(int(input("Enter charger kW rating at first stop(7, 22 or 50): ")))  #sends input into checkInput function
    mileages.append(int(input("Enter mileage at second stop: ")))
    checkInput(int(input("Enter charger kW rating at second stop(7, 22 or 50): ")))
    mileages.append(int(input("Enter mileage at third stop: ")))
    checkInput(int(input("Enter charger kW rating at third stop(7, 22 or 50): ")))

def checkInput(newInput):
    while newInput != 7 and newInput != 22 and newInput != 50:              #checks if value is valid
        newInput = int(input("Invalid charger rating. Please retry: "))     #asks for a retry
    chargersUsed.append(newInput)       #stores valid value

def calculateMileage():
    i=0
    while i !=3 :       #loops through list
        legMiles.append(mileages[i+1] - mileages[i])    #calculates difference
        i += 1

def calculateCost():
    for counter in range(len(legMiles)):        #loops through list
        if chargersUsed[counter] == 7:          #checks charger rating
            legCosts.append(0)      #adds cost to list
        elif chargersUsed[counter] == 22:
            legCosts.append(legMiles[counter] * 0.005)
        else:
            legCosts.append(legMiles[counter] * 0.01)

def printResults():
    total = 0
    for counter in range(len(legCosts)):        #loops through list
        print("Leg", counter+1, "cost £", legCosts[counter])    #prints out leg number and cost
        total = total +legCosts[counter]    #calculates total, not sure if needed
    print("The total cost was £", total)    #prints total

getInputs()         #calls functions
calculateMileage()
calculateCost()
printResults()
