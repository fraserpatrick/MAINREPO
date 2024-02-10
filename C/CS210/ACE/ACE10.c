#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "ACE10List.h"

// This function will test if the pointer p has been freed
int is_freed(void *p);

int main( void ) {
  List list = new_list();

  print_list(list);
  printf("Is empty? %s\n", is_empty(list) ? "TRUE" : "FALSE");
  printf("Size? %d\n", size(list));

  add(list, "Three");
  print_list(list);
  printf("Is empty? %s\n", is_empty(list) ? "TRUE" : "FALSE");
  printf("Size? %d\n", size(list));

  void *test = &(**list);

  add(list, "Two");
  add(list, "One");
  print_list(list);
  printf("Is empty? %s\n", is_empty(list) ? "TRUE" : "FALSE");
  printf("Size? %d\n", size(list));

  printf("Clearing list.\n");
  clear(list);
  print_list(list);
  printf("Is empty? %s\n", is_empty(list) ? "TRUE" : "FALSE");
  printf("Size? %d\n", size(list));

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
