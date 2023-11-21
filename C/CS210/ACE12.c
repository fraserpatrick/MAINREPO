#include <stdio.h>
#include "ACE12List.h"


int main( void ) {
  List list = new_list();

  print_list(list);
  printf("Empty list with get_at(0)? %s\n", (get_at(list, 0) != NULL) ? "YES" : "NO");
  printf("Empty list with replace_at(0)? %s\n", (replace_at(list, 0, "Whatever")) ? "YES" : "NO");

  add(list, "One");
  print_list(list);
  printf("Single element get_at(0)? %s\n", (get_at(list, 0) != NULL) ? "YES" : "NO");
  printf("Single element replace_at(0)? %s\n", (replace_at(list, 0, "ONE")) ? "YES" : "NO");

  print_list(list);
  printf("Single element get_at(1)? %s\n", (get_at(list, 1) != NULL) ? "YES" : "NO");
  printf("Single element replace_at(1)? %s\n", (replace_at(list, 1, "TWO")) ? "YES" : "NO");

  print_list(list);
  add(list, "Two");
  add(list, "Three");
  add(list, "Four");
  add(list, "Five");
  add(list, "Six");
  add(list, "Seven");

  print_list(list);
  for (int i = 0 ; i < 8 ; i++) {
    printf("Value at index %d = %s\n", i, get_at(list, i));
  }

  printf("Replacing index 1: %s\n", (replace_at(list, 1, "2")) ? "YES" : "NO");
  printf("Replacing index 5: %s\n", (replace_at(list, 5, "6")) ? "YES" : "NO");
  printf("Replacing index 7: %s\n", (replace_at(list, 7, "8")) ? "YES" : "NO");

  print_list(list);

  return 0;
}
