struct nodeType {
  char* value;
  struct nodeType* next;
};

typedef struct nodeType Node;

void push(Node** nodePtr, char data[]);
int new_list();
