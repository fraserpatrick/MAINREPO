from turtle import *

speed(0)
goto(300,100)
color('yellow')
bgcolor('black')

b = 200
while b > 0:
    left(b)
    forward(b * 3)
    b = b - 1
done()
