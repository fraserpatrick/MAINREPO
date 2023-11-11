struct nodeType {
  char* value;
  struct nodeType* next;
};

typedef struct nodeType Node;

void push(Node* nodePtr, char data[]);
Node** new_list();
