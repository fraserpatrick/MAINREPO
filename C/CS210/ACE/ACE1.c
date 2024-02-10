#include <stdio.h>
#include "ACE1List.h"

int main( void ) {
  Node root = {"First!", NULL};
  if (root.next == NULL) {
  	printf("%s", root.value);
  }
  return 0;
}
