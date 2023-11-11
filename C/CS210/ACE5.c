#include <stdio.h>
#include "list.h"

int main( void ) {
  List list = new_list();
  push(list, "First!\n");
  push(list, "Second!\n");
  push(list, "Third!\n");
  push(list, "Fourth!");

  printf("%s", (*list)->value);
  printf("%s", (*list)->next->value);
  printf("%s", (*list)->next->next->value);
  printf("%s", (*list)->next->next->next->value);

  return 0;
}
