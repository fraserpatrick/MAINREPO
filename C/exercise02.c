#include <stdio.h>

int main(void){
  int age = 0;
  char name[20] = "";
  char color[20] = "";

  printf("What is the name? ");
  scanf("%19s", name);
  printf("What is the favourite colour? ");
  scanf("%19s", color);
  printf("What is the age? ");
  scanf("%d", &age);

  printf("%s's favourite colour is %s and %s is %d. \n", name, color, name, age);
  return 0;
}
