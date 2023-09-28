#include <stdio.h>

int main(void){

  int input = 0;
  printf("Enter a two digit positive integer: ");
  scanf("%d", &input);

  if(input <= 9 || input >= 100){
    printf("Invalid input! \n");
  }
  else{
    //char output[2] = input;
    printf("The reversal is: %d \n", output);
  }

  return 0;
}
