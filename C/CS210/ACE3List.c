#include <stdlib.h>
#include <string.h>
#include "ACE3List.h"

Node* new_node(char data[]){
  Node* nodeloc = malloc(sizeof(Node));
  strcpy(nodeloc->value, data);
  nodeloc->next = NULL;
  return nodeloc;
}

void delete_node(Node* nodePtr){
  free(nodePtr);
  nodePtr = NULL;
  }
