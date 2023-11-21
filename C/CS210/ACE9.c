#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "ACE9List.h"

// This function will test if the pointer p has been freed
int is_freed(void *p);

int main( void ) {
  List list = new_list();

  add(list, "Three");
  print_list(list);

  void *test = &(**list);

  add(list, "Two");
  print_list(list);

  add(list, "One");
  print_list(list);

  printf("Removing: %s\n", rem(list));
  print_list(list);

  printf("Removing: %s\n", rem(list));
  print_list(list);

  printf("Removing: %s\n", rem(list));
  print_list(list);

  printf("Removing: %s\n", rem(list));
  print_list(list);

  printf("Memory freed? %s\n", (is_freed(test)) ? "Yes! :)": "No! :(");

  return 0;
}

int is_freed(void *p) {
    void *q;
    char p_addr[50];
    char q_addr[50];
    sprintf(p_addr, "%p", p);
    q = malloc (1);
    sprintf(q_addr, "%p", q);
    free(q);
    return !strcmp(q_addr, p_addr);
}
