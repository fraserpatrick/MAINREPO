#include <stdio.h>

int main(void){

  int input = 0;
  char output[2];
  printf("Enter a two digit positive integer: ");
  scanf("%d", &input);

  if(input <= 9 || input >= 100){
    printf("Invalid input! \n");
  }
  else{
    sprintf(output, "%d", input);
    printf("The reversal is: %d%d \n", output[1], output[0]);
  }

  return 0;
}
