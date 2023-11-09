struct nodeType {
  char value[20];
  struct nodeType* next;
};

typedef struct nodeType Node;

Node* new_node(char data[]);
Node* delete_node(void* nodePtr);
