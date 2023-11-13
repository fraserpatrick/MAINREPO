#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "ACE5List.h"

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


void push(Node** listPtr, char data[]){
  printf("%p\n", (*listPtr)->value);
  while ((*listPtr)->next != NULL) {
    printf("AAAAAAAAAAAAAAAAAAa\n");
    *listPtr = (*listPtr)->next;
  }
  (*listPtr)->next = new_node(data);
}

List new_list(){
  Node** list = malloc(sizeof(Node));
  *list = NULL;
  return list;
}
