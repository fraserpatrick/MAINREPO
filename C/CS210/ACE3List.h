struct nodeType {
  char* value;
  struct nodeType* next;
};

typedef struct nodeType Node;

Node* new_node(char data[]);
void delete_node(Node* nodePtr);
