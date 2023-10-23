#include<stdio.h>

int main(void){
  int number = 1;

  while (number != 101){
    if ((number % 3) == 0){
      if ((number % 5) == 0){
        if ((number % 7) == 0){
          if ((number % 9) == 0){
            printf("FizzBuzzBazzBop\n");
          }
          else{
            printf("FizzBuzzBazz\n");
          }
        }
      else if ((number % 9) == 0){
        printf("FizzBuzzBop\n");
        }
      else{
        printf("FizzBuzz\n");
      }
      }
    else if ((number % 7) == 0){
      if ((number % 9) == 0){
        printf("FizzBazzBop\n");
      }
      else{
        printf("FizzBazz\n");
      }
    }
    else if ((number % 9) == 0){
      printf("FizzBop\n");
    }
    else {
      printf("Fizz\n");
    }
  }


    else if ((number % 5) == 0){
      if ((number % 7) == 0){
        if ((number % 9) == 0){
          printf("BuzzBazzBop\n");
        }
        else{
          printf("BuzzBazz\n");
        }
      }
      else if ((number % 9) == 0){
        printf("BuzzBop\n");
      }
      else{
        printf("Buzz\n");
      }
    }


    else if ((number % 7) == 0){
      if ((number % 9) == 0){
        printf("BazzBop\n");
      }
      else {
        printf("Bazz\n");
      }
    }


    else if ((number % 9) == 0){
      printf("Bop\n");
    }
    else{
      printf("%d\n", number);
    }
    number++;
  }
  return 0;
}
