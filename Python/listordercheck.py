list = [] #ENTER LIST HERE
valid = True
i=0

while valid == True and i+1 != len(list):
    if list[i] > list[i+1]:
        valid = False
    i +=1

print(valid)
