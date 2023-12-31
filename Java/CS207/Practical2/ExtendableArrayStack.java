public class ExtendableArrayStack<E> implements StackADT<E>
{
    int top;
    E[] S;
    /**
     * Constructor for objects of class ArrayStack
     */
    public ExtendableArrayStack(int capacity)
    {
        top = -1;
        S = (E[]) new Object[capacity+5];
        // Casting is used in the above as generic arrays cannot be created using new E[]
    }

    public ExtendableArrayStack(){
      top = -1;
      S = (E[]) new Object[5];
    }

   /**
     @throws FullStackException
   */
   public void push(E element){
     if (top == S.length-1) {
       throw new FullStackException("Stack is full, so cannot push on to stack");
     }
    else {
      top++;
      S[top] = element;
      }

   }

   /**
     @throws EmptyStackException
   */
   public E pop(){
     E element;
     if (isEmpty())
        throw new EmptyStackException("Stack is empty, so cannot pop from stack");
     element = S[top];
     top--;
     return element;
   }

   /**
     @throws EmptyStackException
   */
   public E top(){
     E element;
     if (isEmpty())
        throw new EmptyStackException("Stack is empty, so cannot get top from stack");
     element = S[top];
     return element;
   }

   public int size(){
      return top + 1;
   }

   public boolean isEmpty(){
      if (top == -1){
        return true;
      }
      else {
        return false;
      }
   }
}
