#include <stdio.h>
#include "ACE2List.h"

int main( void ) {
  Node *root = new_node("First!");
  if (root->next == NULL) {
  	printf("%s", root->value);
  }
  return 0;
}
