x=input("enter binary:")
y=""
finalvalue=0
for a in reversed(x):
    y=y+a
for i in range(len(y)):
    if int(y[i]) == 1:
        finalvalue = finalvalue +pow(2,i)
print(x, "=", finalvalue)
