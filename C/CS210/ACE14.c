#include <stdio.h>
#include "ACE14List.h"


int main( void ) {
  List list1 = new_list();

  add(list1, "Four");
  add(list1, "Three");
  add(list1, "Two");
  add(list1, "One");

  List list2 = copy_list(list1);

  printf("List 1 = ");
  print_list(list1);
  printf("List 2 = ");
  print_list(list2);

  printf("Different lists? %s\n", (list1 == list2) ? "NO" : "YES");

  Node *node1 = *list1;
  Node *node2 = *list2;
  for (int i = 0 ; i < 4 ; i++) {
    printf("Nodes at index %d different? %s\n", i, (node1 == node2) ? "NO" : "YES");
    node1 = node1->next;
    node2 = node2->next;
  }

  List list3 = sublist(list1, 0, 4);

  printf("List 3 = ");
  print_list(list3);

  printf("Different lists? %s\n", (list1 == list3) ? "NO" : "YES");

  node1 = *list1;
  Node *node3 = *list3;
  for (int i = 0 ; i < 4 ; i++) {
    printf("Nodes at index %d different? %s\n", i, (node1 == node3) ? "NO" : "YES");
  }

  print_list(list1);

  printf("Out of bounds failure check: %s\n", (sublist(list1, -1, 2) == NULL)? "YES" : "NO");
  printf("Out of bounds failure check: %s\n", (sublist(list1, 1, 5) == NULL)? "YES" : "NO");
  printf("Out of bounds failure check: %s\n", (sublist(list1, 2, 1) == NULL)? "YES" : "NO");

  List subs[] = {
    sublist(list1, 0, 2),
    sublist(list1, 1, 3),
    sublist(list1, 2, 4)
  };

  for (int i = 0 ; i < 3 ; i++) {
    print_list(subs[i]);
  }

  return 0;
}
