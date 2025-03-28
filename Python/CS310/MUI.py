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

    index = 0
    while "UU" in string[index:]:
        index = string.index("UU",index)
        output.append(string[:index] + string[index+2:])
        index += 1

    results = []
    for out in output:
        if out not in results:
            results.append(out)

    return output


def extend_path(path):
    output = []
    for state in next_states(path[len(path)-1]):
        output.append(path + [state])
    return output


def breadth_first_search(goal):
    currentPath = []
    agenda = [["MI"]]
    extendCount, agendaMaxLen = 0,0
    expansionLimit = 5000
    while expansionLimit > extendCount:
        agendaMaxLen = max(agendaMaxLen, len(agenda))
        currentPath = agenda.pop(0)
        if currentPath[len(currentPath)-1] == goal:
            return currentPath, extendCount, agendaMaxLen
        newPaths = extend_path(currentPath)
        agenda += newPaths
        extendCount += 1
        
    return ["MI"], extendCount, agendaMaxLen


def depthlimited_dfs(goal, limit):
    currentPath = []
    agenda = [["MI"]]
    extensions = 0
    maxAgenda = 1
    while len(agenda) != 0:
        currentPath = agenda.pop(0)
        if currentPath[len(currentPath)-1] == goal:
            extensions += 1
            return currentPath, extensions, maxAgenda
        if len(currentPath) <= limit:
            newPaths = extend_path(currentPath)
            agenda = newPaths + agenda
            extensions += 1
            maxAgenda = max(maxAgenda, len(agenda))
            
    return ["MI"], extensions, maxAgenda


def depthlimited_dfs2(goal, limit):
    currentPath = []
    agenda = [["MI"]]
    extensions = 0
    maxAgenda = 1
    while len(agenda) != 0:
        currentPath = agenda.pop(0)
        extensions += 1
        if currentPath[len(currentPath)-1] == goal:
            return currentPath, extensions, maxAgenda
        if len(currentPath) <= limit:
            newPaths = extend_path(currentPath)
            agenda = newPaths + agenda
            maxAgenda = max(maxAgenda, len(agenda))
            
    return ["MI"], extensions, maxAgenda


def dfs_iter(goal):
    depth = 2
    expands = 0
    maxAgenda=0
    while True:
        path, expansions, agenda = depthlimited_dfs2(goal, depth)
        expands += expansions
        maxAgenda = max(maxAgenda, agenda)
        if path[len(path)-1] == goal:
            return path, expands, maxAgenda
        depth += 1


def breadth_first_dictionarysearch(goal):
    agenda = ["MI"]
    extendCount, agendaMaxLen = 0,0
    visited = set()
    ancestors = {"MI":None}
    path = []
    limit = 10000

    while extendCount < limit:
        agendaMaxLen = max(agendaMaxLen, len(agenda))
        currentNode = agenda.pop(0)

        if currentNode == goal:
            while currentNode != "MI":
                path.append(currentNode)
                currentNode = ancestors[currentNode]
            path.append("MI")
            path.reverse()
            return path, extendCount, agendaMaxLen
        
        extendCount += 1
        newNodes = next_states(currentNode)
        for node in newNodes:
            if node not in visited:
                visited.add(node)
                agenda.append(node)
                ancestors[node] = currentNode

    return ["MI"], extendCount, agendaMaxLen


def estimate_steps(current, goal):
    currentCount, goalCount = 0,0
    for x in current:
        if x == "I":
            currentCount += 1
        if x == "U":
            currentCount += 3

    for x in goal:
        if x == "I":
            goalCount += 1
        if x == "U":
            goalCount += 3


    if current == goal:
        return 0
    if goalCount>currentCount:
        return 1
    return 2


def estimate_stepsORIGINAL(current, goal):
    if current == goal:
        return 0
    return 1


def aStarSearch(goal):
    agenda = [(0, "MI")]
    extendCount, agendaMaxLen = 0, 0
    visited = set()
    ancestors = {"MI": None}
    path = []

    while agenda:
        agendaMaxLen = max(agendaMaxLen, len(agenda))
        agenda.sort(key=lambda x: x[0])
        cost, currentNode = agenda.pop(0)

        if currentNode == goal:
            while currentNode != "MI":
                path.append(currentNode)
                currentNode = ancestors[currentNode]
            path.append("MI")
            path.reverse()
            return path, extendCount, agendaMaxLen

        extendCount += 1
        newNodes = next_states(currentNode)
        for node in newNodes:
            if node not in visited:
                visited.add(node)
                ancestors[node] = currentNode
                heuristicCost = estimate_steps(node, goal)
                totalCost = cost + heuristicCost
                agenda.append((totalCost, node))

    return ["MI"], extendCount, agendaMaxLen


def test():
    print(next_states("MI"))
    print(extend_path(["MI", "MII"]))
    breadthPath,breadthExpansions,breadthMax = breadth_first_search("MUIU")
    print("--------------------------")
    print("PATH: " + str(breadthPath))
    print("EXPANSIONS: " + str(breadthExpansions))
    print("MAX AGENDA: " + str(breadthMax))
    depthPath,depthExpansions,depthMax = depthlimited_dfs("MIIIUIU",4)
    print("PATH: " + str(depthPath))
    print("EXPANSIONS: " + str(depthExpansions))
    print("MAX AGENDA: " + str(depthMax))
    depthPath,depthExpansions,depthMax = dfs_iter("MIIIUII")
    print("PATH: " + str(depthPath))
    print("EXPANSIONS: " + str(depthExpansions))
    print("MAX AGENDA: " + str(depthMax))
    breadthPath,breadthExpansions,breadthMax = breadth_first_dictionarysearch("MIUUIUUII")
    print("--------------------------")
    print("PATH: " + str(breadthPath))
    print("EXPANSIONS: " + str(breadthExpansions))
    print("MAX AGENDA: " + str(breadthMax))
    breadthPath,breadthExpansions,breadthMax = breadth_first_dictionarysearch("MIUUIUUII")
    print("--------------------------")
    print("PATH: " + str(breadthPath))
    print("EXPANSIONS: " + str(breadthExpansions))
    print("MAX AGENDA: " + str(breadthMax))

    aStarPath,aStarExpansions,aStarMax = aStarSearch("MUUUIIIII")
    print("--------------------------")
    print("PATH: " + str(aStarPath))
    print("EXPANSIONS: " + str(aStarExpansions))
    print("MAX AGENDA: " + str(aStarMax))

test()