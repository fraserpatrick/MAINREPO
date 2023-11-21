#include <stdio.h>
#include "ACE11List.h"


int main( void ) {
  List list = new_list();

  print_list(list);

  printf("Index of '%s' is %d\n", "Test", index_of(list, "Test"));

  add(list, "Test");
  printf("Index of '%s' is %d\n", "Test", index_of(list, "Test"));

  add(list, "Thing");
  printf("Index of '%s' is %d\n", "Test", index_of(list, "Test"));

  add(list, "ABCD");
  printf("Index of '%s' is %d\n", "Test", index_of(list, "Test"));

  print_list(list);
  printf("Index of '%s' is %d\n", "ABCD", index_of(list, "ABCD"));

  printf("List contains '%s'? %s\n", "Test", contains(list, "Test") ? "Yes" : "No");
  printf("List contains '%s'? %s\n", "Thing", contains(list, "Thing") ? "Yes" : "No");
  printf("List contains '%s'? %s\n", "ABCD", contains(list, "ABCD") ? "Yes" : "No");


  return 0;
}
