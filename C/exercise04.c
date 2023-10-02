#include <stdio.h>

int main(void){

  int input = 0;
  int output = 0;
  printf("Enter a two digit positive integer: ");
  scanf("%d", &input);

  if(input <= 9 || input >= 100){
    printf("Invalid input! \n");
  }
  else{
    while (input != 0) {
      int digit = input % 10;
      output = output * 10 + digit;
      input /= 10;
    }

    printf("The reversal is: %d \n", output);
  }

  return 0;
}
