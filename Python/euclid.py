# prime.py

# A Python program to illustrate the proof that there are an infinite
# number of prime numbers.

# Author: John Levine
# Date: 8th October 2012

from math import ceil, sqrt

# Main loop: read in a number (the supposedly biggest prime number)
# and return a prime number which is bigger than the one you input.

# This works because of Euclid's brilliant proof.

def main():
    while True:
        print()
        str = input('Please enter a prime number: ')
        if str == 'q':
            print()
            return True
        nextp(eval(str))

# Factorial of N = 1 x 2 x 3 x ... x N. Here we calculate it in the
# reverse order, starting with N and working down to 1.

# Non-recursive definition for efficiency.

def factorial(n):
    result = n
    for i in range(n-1,1,-1):
        result = result * i
    return result

# Return the smallest prime divisor of N, by attempting to divide it
# by all integers up to N itself. This is not the most efficient way
# of doing it but it has the advantage that it works for big numbers
# in Python.

def smallest_prime_divisor(n):
    d = 2
    while True:
        if (n % d) == 0:
            return d
        d = d + 1

# Given a prime number N, calculate N!+1 and then find the smallest
# prime divisor, which will be a prime number bigger than N.

def nextp(n): # calculate a bigger prime number
    print('N =', n)
    k = factorial(n)
    print('N! =', k)
    m = k + 1
    print('N!+1 =', m)
    p = smallest_prime_divisor(m)
    print('Smallest prime divisor of M = ', p)

main()
