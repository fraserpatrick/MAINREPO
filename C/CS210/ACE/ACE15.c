#include <stdio.h>
#include <string.h>
#include "ACE15List.h"


int main( void ) {
  List list = new_list();

  push(list, "Easy!");
  push(list, "One, Two, Three");
  push(list, "\"\"");
  push(list, "\"Help\"");
  push(list, "\",\"Even I hate me sometimes.\",\"Argh!");
  push(list, ",;:@'#~][{}|\\!£$%^&*()_+=-`¬");
  push(list, "");
  push(list, "");

  print_list(list);

  save_list(list, "ACE15ListFile.lst");

  List list2 = load_list("ACE15ListFile.lst");

  print_list(list2);

  printf("Checking for different lists: %s\n", (list == list2) ? "NO" : "YES");
  printf("Checking if lists are the same length: %s\n", (size(list) == size(list2)) ? "YES" : "NO");

  printf("Checking if all elements are the same: ");
  int same = 1;
  for(int i = 0 ; i < size(list) ; i++) {
    same &= strcmp(get_at(list, i), get_at(list2, i)) == 0;
  }
  printf("%s\n", same ? "YES" : "NO");

  return 0;
}
