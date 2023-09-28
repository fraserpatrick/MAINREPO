#include <stdio.h>

int main(void){

  int input = 0;
  char output[5];
  printf("Enter a two digit positive integer: ");
  scanf("%s", output);

  if(input <= 9 || input >= 100){
    printf("Invalid input! \n");
  }
  else{
    sprintf(output, "%d", input);
    printf("The reversal is: %d%d \n", output[1], output[0]);
  }

  return 0;
}
