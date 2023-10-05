public class ArrayStack<E> implements StackADT<E>
{
    int top;
    E[] S;
    /**
     * Constructor for objects of class ArrayStack
     */
    public ArrayStack(int capacity)
    {
        top = -1;
        S = (E[]) new Object[capacity]; 
        // Casting is used in the above as generic arrays cannot be created using new E[]
    }

   /** 
     @throws FullStackException
   */
   public void push(E element){
     if (top == S.length-1)
        throw new FullStackException("Stack is full, so cannot push on to stack");
     top++;
     S[top] = element;
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
     //add method body
   }

   public int size(){
      //add method body
   }

   public boolean isEmpty(){
      //add method body
   }  
}
