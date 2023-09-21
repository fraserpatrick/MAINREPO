#include <stdio.h>

int main(void){

  printf("What is the name? ");
  scanf("%s", name);
  printf("What is the age? ");
  scanf("%d", age);
  printf("What is the favourite colour? ");
  scanf("%s", color);

  printf("%s is %d and %s's favourite colour is %s \n", name, age, name, color);
  return 0;
}
