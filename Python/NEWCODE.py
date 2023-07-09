# National 5 Computing Coursework - Finlay Patrick
# Gather data from the driver as integers
a = int(input("Enter your starting mileage:"))
b = int(input("Enter the mileage at the first stop:"))
c = int(input("Enter the charger kW rating at first stop(7, 22 or 50):"))
# INPUT VALIDATION NEEDED

while c != 7 and c != 22 and c != 50:              #checks if value is valid
    c = int(input("Invalid charger rating. Please retry: "))

d = int(input("Enter the mileage at the second stop:"))
e = int(input("Enter the charger kW rating at second stop(7, 22 or 50):"))
# INPUT VALIDATION NEEDED
while e != 7 and e != 22 and e != 50:              #checks if value is valid
    e = int(input("Invalid charger rating. Please retry: "))

f = int(input("Enter the mileage at the third stop:"))
g = int(input("Enter the charger kW rating at third stop(7, 22 or 50):"))
# INPUT VALIDATION NEEDED
while g != 7 and g != 22 and g != 50:              #checks if value is valid
    g = int(input("Invalid charger rating. Please retry: "))

# Charger rate costs
h = float(0.005) # 22kw charger cost
i = float(0.01) # 50kw charger cost

# Calculate and display mileage for each journey leg and the total
miles_leg_1 = int(b - a)
print("Leg 1 mileage entered is:" ,miles_leg_1)
miles_leg_2 = int(d - b)
print("Leg 2 mileage entered is:" ,miles_leg_2)

miles_leg_3 = int(f - d)
print("Leg 3 mileage entered is:" ,miles_leg_3)
print("Your total mileage is:" ,(miles_leg_1 + miles_leg_2 + miles_leg_3))

# Calculate the costs for Leg 1, save as variables and display
if c == 22:
    cost_leg_1 = (h * miles_leg_1)
elif c == 50:
    cost_leg_1 = (i * miles_leg_1)
elif c == 7:
    cost_leg_1 = 0
print("Your leg 1 cost is £", cost_leg_1)

# Calculate the costs for Leg 2, save as variables and display
if e == 22:
    cost_leg_2 = (h * miles_leg_2)
elif e == 50:
    cost_leg_2 = (i * miles_leg_2)
elif e == 7:
    cost_leg_2 = 0
print("Your leg 2 cost is £", cost_leg_2)

# Calculate the costs for Leg 3, save as variables and display
if g == 22:
    cost_leg_3 = (h * miles_leg_3)
elif g == 50:
    cost_leg_3 = (i * miles_leg_3)
elif g == 7:
    cost_leg_3 = 0
print("Your leg 3 cost is £", cost_leg_3)

total = cost_leg_1 + cost_leg_2 + cost_leg_3
print("Total cost is £", total)
