#include <stdio.h>

int main(void){

  char input[10] = "";
  printf("Enter a two digit positive integer: ");
  scanf("%s", input);
  printf("The reversal is: %s and size %ld \n", input, sizeof(input));

  return 0;
}
