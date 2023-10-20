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
    // System.out.println("ENQUEUE FRONT: "+f+"    ENQUEUE REAR"+r);
      if (size() == N-2){
      //  System.out.println("PASSS");
        N=N+5;
        extendArray();
      //  System.out.println("FRONT: "+f+"    REAR: "+r);
      }
      Q[r] = element;
      r = (r+1)%N;
    //  System.out.println("ENQUEUE FRONT: "+f+"    ENQUEUE REAR"+r);
    }

    private void extendArray(){
      E[] temp = (E[]) new Object[N-5];
      temp = Q;
      E[] Q = (E[]) new Object[N];
      for (int counter = 0; counter < size()-1; counter++){
      //  System.out.println("COUNTER " + counter + ": "+temp[counter]+Q[counter]);
        //System.out.println("COUNTER " + counter + ": "+temp[counter]+Q[counter]);
      }
    }

    /**
      @throws EmptyQueueException
    */
    public E dequeue(){
    //  System.out.println("DEQUEUE FRONT: "+f+"    DEQUEUE REAR"+r);
      if (isEmpty())
       throw new EmptyQueueException("Nothing in queue");
     E element = Q[f];
     f = (f+1)%N;
    // System.out.println("DEQUEUE FRONT: "+f+"    DEQUEUE REAR"+r);
     return element;
    }

    /**
      @throws EmptyQueueException
    */
    public E front(){
      if (isEmpty())
       throw new EmptyQueueException("Nothing in queue");
      return Q[f];
    }

    public int size(){
      return (N - f + r)%N;
    }

    public boolean isEmpty(){
      return (f==r);
    }
}
