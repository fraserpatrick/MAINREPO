#include <stdio.h>
#include <stdlib.h>
#include "ACE13List.h"


int main( void ) {
  char *value = "INSERTED";
  List list = new_list();

  print_list(list);
  printf("Removing from empty list? %s\n", (remove_at(list, 0) == NULL) ? "NO" : "YES");
  printf("Inserting into empty list? %s\n", insert_at(list, 0, value) ? "YES" : "NO");
  print_list(list);
  printf("Removing from single element list? %s\n", (remove_at(list, 0) == NULL) ? "NO" : "YES");
  print_list(list);

  printf("\nSingle element list.\n");
  add(list, "Zero");
  print_list(list);
  for (int index = -1 ; index < 2 ; index++) {
    printf("Inserting at %d? %s\n", index, insert_at(list, index, value) ? "YES" : "NO");
    print_list(list);
    printf("Removing from %d? %s\n", index, (remove_at(list, index) == NULL) ? "NO" : "YES");
    print_list(list);
  }

  clear(list);

  printf("\nBuilding a bigger list ...\n");
  add(list, "Three");
  add(list, "Two");
  add(list, "One");
  add(list, "Zero");
  print_list(list);

  for (int index = -1 ; index < 6 ; index++) {
    printf("Inserting at %d? %s\n", index, insert_at(list, index, value) ? "YES" : "NO");
    print_list(list);
    printf("Removing from %d? %s\n", index, (remove_at(list, index) == NULL) ? "NO" : "YES");
    print_list(list);
  }
  clear(list);
  free(list);
  list = NULL;
  return 0;
}
