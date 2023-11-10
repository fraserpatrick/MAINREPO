#include <stdlib.h>
#include <string.h>
#include "ACE4List.h"

Node* new_node(char data[]){
  Node* nodeloc = malloc(sizeof(Node));
  nodeloc->value = data;
  nodeloc->next = NULL;
  return nodeloc;
}

void delete_node(Node* nodePtr){
  free(nodePtr);
  nodePtr = NULL;
  }


void push(Node* nodePtr){
  while (nodePtr-> != NULL) {
    printf("%s", current->value);
    current = current->next;
}
