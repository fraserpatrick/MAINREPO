#include<stdio.h>

int main(void){
  int number = 1;

  while (number != 101){
    if ((number % 3) == 0){
      if ((number % 5) == 0){
        if ((number % 7) == 0){
          printf("FizzBuzzBazz\n");
        }
      else{
        printf("FizzBuzz\n");
        }
      }
    else if ((number % 7) == 0){
      printf("FizzBazz\n");
    }
    else{
      printf("Fizz\n");
    }
  }
    else if ((number % 5) == 0){
      if ((number % 7) == 0){
        printf("BuzzBazz\n");
      }
      else{
        printf("Buzz\n");
      }
    }
    else if ((number % 7) == 0){
      printf("Bazz\n");
    }
    else{
      printf("%d\n", number);
    }
    number++;
  }
  return 0;
}
