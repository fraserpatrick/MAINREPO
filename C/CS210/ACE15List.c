#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "ACE15List.h"

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
    delete_node(*listPtr);
    return item;
  }
  else {
    char* item = (*listPtr)->next->value;
    delete_node((*listPtr)->next);
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

char* peek(List listPtr){
  while (*listPtr != NULL && (*listPtr)->next != NULL) {
      listPtr = &((*listPtr)->next);
  }
  if (*listPtr == NULL) {
    return NULL;
  }
  return (*listPtr)->value;
}

void add(List listPtr, char data[]){
  if (*listPtr == NULL) {
    *listPtr = new_node(data);
  }
  else{
    void* temp = *listPtr;
    *listPtr = new_node(data);
    (*listPtr)->next = temp;
  }
}

char* rem(List listPtr){
  if (*listPtr == NULL) {
    return NULL;
  }
  else{
    void* temp = (*listPtr)->next;
    char* item = (*listPtr)->value;
    delete_node(*listPtr);
    *listPtr = temp;
    return item;
  }
}

int is_empty(List listPtr){
  return (*listPtr == NULL);
}

int size(List listPtr){
  int counter = 1;
  if (is_empty(listPtr)){
    return 0;
  }
  while (*listPtr != NULL && (*listPtr)->next != NULL) {
      listPtr = &((*listPtr)->next);
      counter++;
  }
  return counter;
}

void clear(List listPtr){
  while (*listPtr != NULL) {
    rem(listPtr);
  }
}

int index_of(List listPtr, char item[]){
  int counter = 0;
  if (is_empty(listPtr)){
    return -1;
  }
  if ((*listPtr)->value == item){
    return 0;
  }

  if ((*listPtr)->next->value == item){
    return 1;
  }

  while ((*listPtr)->next != NULL) {
    counter++;
    if ((*listPtr)->next->value == item){
      return counter;
    }
    listPtr = &((*listPtr)->next);

  }
  return -1;
}

int contains(List listPtr, char item[]){
  return (index_of(listPtr, item) != -1);
}

char* get_at(List listPtr, int index){
  if (index+1 > size(listPtr)){
    return NULL;
  }
  else {
    int counter = 0;
    while (counter != index){
      listPtr = &((*listPtr)->next);
      counter++;
    }
    return (*listPtr)->value;
  }
}

int replace_at(List listPtr, int index, char data[]){
  if (index+1 > size(listPtr)){
    return 0;
  }
  else {
    int counter = 0;
    while (counter != index){
      listPtr = &((*listPtr)->next);
      counter++;
    }
    (*listPtr)->value = data;
    return 1;
  }
}

int insert_at(List listPtr, int index, char data[]){
  if (index > size(listPtr) || index < 0){
    return 0;
  }
  else if (index == 0){
    add(listPtr, data);
    return 1;
  }
  else if (index == size(listPtr)){
    push(listPtr, data);
    return 1;
  }
  else {
    int counter = 0;
    while (counter != index-1){
      listPtr = &((*listPtr)->next);
      counter++;
    }
    void* temp = (*listPtr)->next;
    (*listPtr)->next = new_node(data);
    (*listPtr)->next->next = temp;
    return 1;
  }
}

char* remove_at(List listPtr, int index){
  if (index+1 > size(listPtr) || index < 0){
    return NULL;
  }
  else if (index == 0){
    return rem(listPtr);
  }
  else if (index+1 == size(listPtr)){
    int counter = 0;
    while (counter != index-1){
      listPtr = &((*listPtr)->next);
      counter++;
    }
    char* item = (*listPtr)->next->value;
    delete_node((*listPtr)->next);
    (*listPtr)->next = NULL;
    return item;
  }
  else {
    int counter = 0;
    while (counter != index-1){
      listPtr = &((*listPtr)->next);
      counter++;
    }
    void* temp = (*listPtr)->next;
    char* item = (*listPtr)->next->value;
    (*listPtr)->next = (*listPtr)->next->next;
    delete_node(temp);
    return item;
  }
}

List copy_list(List oldListPtr){
  List newList = new_list();
  for (int counter = 0; counter < size(oldListPtr); counter++){
    push(newList, get_at(oldListPtr, counter));
  }
  return newList;
}

List sublist(List oldListPtr, int startPtr, int endPtr){
  if (startPtr < 0 || startPtr > size(oldListPtr)-1 || startPtr > endPtr || endPtr > size(oldListPtr)){
    return NULL;
  }
  else{
    List newList = new_list();
    for (int counter = startPtr; counter < endPtr; counter++){
      push(newList, get_at(oldListPtr, counter));
    }
    return newList;
  }
}

int save_list(List listPtr, char fileName[]){
  FILE* fileWrite;
  fileWrite = fopen(fileName, "w");
  for (int counter = 0; counter < size(listPtr); counter++){
    fprintf(fileWrite, "%s\n", get_at(listPtr, counter));
  }
  fclose(fileWrite);
  return -1;
}

List load_list(char fileName[]){
  List newList = new_list();
  FILE* fileRead;
  fileRead = fopen(fileName, "r");
  char newData[50];
  for (int counter = 0; counter < 9; counter++){
    fgets(newData, 50, fileRead);
    printf("%s\n", newData);
    push(newList, newData);
  }

  fclose(fileRead);

  return newList;
}
