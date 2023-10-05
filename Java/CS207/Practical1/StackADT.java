public interface StackADT<E>
{
  public void push(E element);

   /**
    * @throws EmptyStackException
   */
   public E pop();
 
   /**
    * @throws EmptyStackException
   */
   public E top();

   public int size();

   public boolean isEmpty();
}
