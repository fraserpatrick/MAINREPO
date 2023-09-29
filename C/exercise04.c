#include <stdio.h>

int main(void){

  int input = 0;
  char output[5];
  printf("Enter a two digit positive integer: ");
  scanf("%d", input);

  if(input <= 9 || input >= 100){
    printf("Invalid input! \n");
  }
  else{
    printf("The reversal is: %d \n", input);
  }

  return 0;
}
