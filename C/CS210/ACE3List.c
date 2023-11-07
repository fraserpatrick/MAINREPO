#include <stdlib.h>
#include <string.h>
#include "ACE3List.h"

Node* new_node(char data[]){
  Node* nodeloc = malloc(sizeof(Node));
  strcpy(nodeloc->value, data);
  return nodeloc;
}
