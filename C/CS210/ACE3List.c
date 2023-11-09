#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "ACE3List.h"

Node* new_node(char data[]){
  Node* nodeloc = malloc(sizeof(Node));
  strcpy(nodeloc->value, data);
  nodeloc->next = NULL;
  return nodeloc;
}

Node* delete_node(void* nodePtr){
  free(nodePtr);
  return nodePtr;
  }
