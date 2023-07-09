array = [1,5,6,9,12,23,34,45,56]
SearchKey = int(input("Enter a search key"))
found = False
startpos = 0
endpos = len(array)

while found != True or (startpos > endpos):
    mid = (startpos + endpos) // 2
    if array[mid] < SearchKey:
        startpos = mid + 1
    else:
        endpos = mid - 1
    if array[mid] == SearchKey:
        found = True
        print("Item has been found in posistion ", mid)
if found == False:
    Print("Item not found")
