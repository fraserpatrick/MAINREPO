#include <stdio.h>
#include "ACE4List.h"

int main( void ) {
  Node *root = new_node("First!\n");
  push(root, "Second!\n");
  push(root, "Third!\n");
  push(root, "Fourth!");

  Node *current = root;

  while (current != NULL) {
    printf("%s", current->value);
    current = current->next;
  }

  return 0;
}
