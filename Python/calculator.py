import pygame
pygame.init()

red = (255,0,0)
background=(255,255,255)
grey=(170,170,170)
darkgrey=(120,120,120)
black=(0,0,0)
result = input = 0.0

font80 = pygame.font.SysFont('Times new roman',60)
inputnumber = font80.render(str(input),True,black)
resultnumber = font80.render(str(result),True,black)
plusbutton = font80.render("+",True,black)
subtractbutton = font80.render("-",True,black)
multiplybutton = font80.render("x",True,black)
dividebutton = font80.render("÷",True,black)

screen = pygame.display.set_mode((400,600))
screen.fill(background)
pygame.display.set_caption(u'Calculator')

def runscreen():
    global result, resultnumber, input
    updatescreen()
    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
            if event.type == pygame.MOUSEBUTTONDOWN:
                if 345 <= mouse[0] <= 395 and 380 <= mouse[1] <= 430:
                    add()
                    updatescreen()
                if 345 <= mouse[0] <= 395 and 435 <= mouse[1] <= 485:
                    subtract()
                    updatescreen()
                if 345 <= mouse[0] <= 395 and 490 <= mouse[1] <= 540:
                    multiply()
                    updatescreen()
                if 345 <= mouse[0] <= 395 and 545 <= mouse[1] <= 595:
                    divide()
                    updatescreen()
                if 0 <= mouse[0] <= 10 and 0 <= mouse[1] <= 10:
                    result = 0.0
                    resultnumber = font80.render(str(result),True,black)
                    updatescreen()
                if 5 <= mouse[0] <= 85:
                    if 260 <= mouse[1] <= 340:
                        print("7")
                        input = 7
                        updatescreen()
                    if 345 <= mouse[1] <= 425:
                        print("4")
                    if 430 <= mouse[1] <= 510:
                        print("1")
                    if 515 <= mouse[1] <= 595:
                        print("+/-")
                if 90 <= mouse[0] <= 170:
                    if 260 <= mouse[1] <= 340:
                        print("8")
                    if 345 <= mouse[1] <= 425:
                        print("5")
                    if 430 <= mouse[1] <= 510:
                        print("2")
                    if 515 <= mouse[1] <= 595:
                        print("0")
                if 175  <= mouse[0] <= 255:
                    if 260 <= mouse[1] <= 340:
                        print("9")
                    if 345 <= mouse[1] <= 425:
                        print("6")
                    if 430 <= mouse[1] <= 510:
                        print("3")
                    if 515 <= mouse[1] <= 595:
                        print(".")
                updatescreen()


        mouse = pygame.mouse.get_pos()


def updatescreen():
    inputnumber = font80.render(str(input),True,black)
    
    pygame.draw.rect(screen,grey,(5,5,390,65))
    pygame.draw.rect(screen,grey,(5,75,390,65))
    screen.blit(inputnumber,(10,5))
    screen.blit(resultnumber,(10,75))

    pygame.draw.rect(screen,grey,(345,380,50,50))
    pygame.draw.rect(screen,grey,(345,435,50,50))
    pygame.draw.rect(screen,grey,(345,490,50,50))
    pygame.draw.rect(screen,grey,(345,545,50,50))

    screen.blit(plusbutton,(353,372.5))
    screen.blit(subtractbutton,(360,420))
    screen.blit(multiplybutton,(350,485))
    screen.blit(dividebutton,(350,540))


    for x in range(3):
        for i in range(4):
            pygame.draw.rect(screen,grey,((x*85)+5,(i*85)+260,80,80))



    pygame.display.update()



def add():
    global result
    result = result+input
    resultnumber = font80.render(str(result),True,black)
    print("ADD")

def subtract():
    global result
    result = result-input
    resultnumber = font80.render(str(result),True,black)
    print("SUBTRACT")

def multiply():
    global result
    result = result*input
    resultnumber = font80.render(str(result),True,black)
    print("MULTIPLY")

def divide():
    global result, resultnumber
    if input != 0:
        result = result/input
        resultnumber = font80.render(str(result),True,black)
    else:
        resultnumber = font80.render("ERROR",True,black)
    print("DIVIDE")

runscreen()
