/**
 * This class is for completion in Practical 3ii
*/
public class ExtendableArrayQueue<E> implements QueueADT<E>
{
   protected E[] Q; // Q will refer to the array
   protected int f; // front - array index of element at front of queue
   protected int r; // rear - array index of where next element added will be placed 
   protected int N;  // array capacity

   /**
    * Constructor for objects of class ExtendableArrayQueue.
    * In practical 3ii no change need be made to this constructor.
    * With this constructor a queue can initially hold up to 
    * 3 (i.e.N-1) items when using the approach described in lectures.
    */
   public ExtendableArrayQueue()
   {
       N=4;
       Q = (E[]) new Object[N]; 
       f=0;
       r=0;
   }
   
   // Complete the method bodies below and add any further methods if 
   // appropriate. Many of the method bodies can be the same as in Q3i
   
   public void enqueue(E element){
   }
   
   /**
     @throws EmptyQueueException
   */
   public E dequeue(){
   }
   
   /**
     @throws EmptyQueueException
   */
   public E front(){
   }

   public int size(){
   }

   public boolean isEmpty(){
   }  
}
