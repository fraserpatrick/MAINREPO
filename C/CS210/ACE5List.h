struct nodeType {
  char* value;
  struct nodeType* next;
};

typedef struct nodeType Node;
typedef Node** List;

void push(Node** nodePtr, char data[]);
List new_list();
