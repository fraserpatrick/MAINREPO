#include <stdio.h>
#include "ACE5List.h"

int main( void ) {
  List list = new_list();
  printf("POINTER AT START: %p\n", (*list));
  push(list, "First!\n");
  printf("PASS 1\n");
  push(list, "Second!\n");
  printf("PASS 2\n");
  push(list, "Third!\n");
  printf("PASS 3\n");
  push(list, "Fourth!\n");
  printf("PASSSSSSSSSSSS\n");
  printf("POINTER AT END: %p\n", (*list));
  printf("%s", (*list)->value);
  printf("%s", (*list)->next->value);
  printf("%s", (*list)->next->next->value);
  printf("%s", (*list)->next->next->next->value);

  return 0;
}
