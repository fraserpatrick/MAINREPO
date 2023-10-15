public interface QueueADT<E>
{
   /**
    * may throw FullQueueException
    */   public void enqueue(E element);
   
   /**
    * throws EmptyQueueException
    */
   public E dequeue();
   
   /**
    * throws EmptyQueueException
    */
   public E front();

   public int size();

   public boolean isEmpty();
}
