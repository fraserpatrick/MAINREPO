struct nodeType {
  char* value;
  struct nodeType* next;
};

typedef struct nodeType Node;
typedef Node** List;

void push(List listPtr, char data[]);
List new_list();
char* pop(List listPtr);
