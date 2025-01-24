def next_states(string):
    output = []
    if len(string) == 0:
        return []
    
    if string[len(string)-1] == "I":
        output.append(string + "U")

    if string[0] == "M":
        output.append(string + string[1:])

    for i in range(len(string)-2):
        if string[i] == "I" and string[i+1] == "I" and string[i+2] == "I":
            output.append(string[:i] + "U" + string[i+3:])

    if "UU" in string:
        output.append(string.replace("UU",""))

    return output

print(next_states("MI"))
print(next_states("MIU"))
print(next_states("MUI"))
print(next_states("MIIII"))
print(next_states("MUUII"))
print(next_states("MUUUI"))