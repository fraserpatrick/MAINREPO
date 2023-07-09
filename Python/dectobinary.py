x = int(input("enter decimal:"))
list = [""]
value = ""
counter = 0
while True:
    if counter == 4:
        list.append(" ")
        counter = 0
    counter += 1
    if x % 2 == 0:
        x = x/2
        list.append("0")
    else:
        x = x-1
        x = x/2
        list.append("1")
    if x == 0:
        break
for a in reversed(list):
    value = value+a
print(value)
