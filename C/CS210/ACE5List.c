#include <stdlib.h>
#include <string.h>
#include "ACE5List.h"

Node* new_node(char data[]){
  Node* nodeloc = malloc(sizeof(Node));
  nodeloc->value = data;
  nodeloc->next = NULL;
  return nodeloc;
}

void push(List listPtr, char data[]) {
    while (*listPtr != NULL && (*listPtr)->next != NULL) {
        listPtr = &((*listPtr)->next);
    }

    if (*listPtr == NULL) {
        *listPtr = new_node(data);
    }
    else {
        (*listPtr)->next = new_node(data);
    }
}


List new_list(){
  List list = malloc(sizeof(Node));
  *list = NULL;
  return list;
}
