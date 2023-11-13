#include <stdlib.h>
#include <string.h>
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
  }
  else if ((*listPtr)->next == NULL) {
    (*listPtr)->next = new_node(data);
  }
  else if ((*listPtr)->next->next == NULL) {
    (*listPtr)->next->next = new_node(data);
  }
  else if ((*listPtr)->next->next->next == NULL) {
    (*listPtr)->next->next->next = new_node(data);
  }
  else if ((*listPtr)->next->next->next->next == NULL) {
    (*listPtr)->next->next->next->next = new_node(data);
  }
}


List new_list(){
  List list = malloc(sizeof(Node));
  *list = NULL;
  return list;
}
