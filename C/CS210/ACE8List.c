#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "ACE8List.h"

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

char* pop(List listPtr){
  while (*listPtr != NULL && (*listPtr)->next != NULL && (*listPtr)->next->next != NULL) {
      listPtr = &((*listPtr)->next);
  }

  if (*listPtr == NULL) {
    return NULL;
  }
  else if ((*listPtr)->next == NULL) {
    char* item = (*listPtr)->value;
    free(*listPtr);
    *listPtr = NULL;
    return item;
  }
  else {
    char* item = (*listPtr)->next->value;
    free((*listPtr)->next);
    (*listPtr)->next = NULL;
    return item;
  }
}

void print_list(List listPtr){
  if (*listPtr == NULL) {
    printf("[]\n");
  }
  else if ((*listPtr)->next == NULL){
    printf("[\"%s\"]\n",(*listPtr)->value);
  }
  else{
    printf("[\"%s\"",(*listPtr)->value);
    while (*listPtr != NULL && (*listPtr)->next != NULL && (*listPtr)->next->next != NULL) {
        listPtr = &((*listPtr)->next);
        printf(", \"%s\"",(*listPtr)->value);
    }
    printf(", \"%s\"]\n",(*listPtr)->next->value);
  }
}
