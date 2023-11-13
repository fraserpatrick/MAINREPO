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

void push(List listPtr, char data[]){
  if ((*listPtr) == NULL){
    (*listPtr) = new_node(data);
    printf("GJGDSJGFJ    %s", (*listPtr)->value);
  }
  else {
    while ((*listPtr)->next != NULL) {
      printf("111111111  %p\n", (*listPtr));
      *listPtr = (*listPtr)->next;
      printf("222222222  %p\n", (*listPtr));
    }
    (*listPtr)->next = new_node(data);
    printf("%p     %s\n", (*listPtr), (*listPtr)->next->value);
  }
}


List new_list(){
  List list = malloc(sizeof(Node));
  *list = NULL;
  return list;
}
