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
      if (size() == N-2){
        N=N+10;
        extendArray();
      }
      Q[r] = element;
      r = (r+1)%N;
    }

    private void extendArray(){
      E[] temp = (E[]) new Object[N];
      int counter = 0;
      if (f <= r) {
        for (int i = f; i < r; i++) {
            temp[counter] = Q[i];
            counter++;
        }
      }
      else {
        for (int i = f; i < N; i++) {
            temp[counter] = Q[i];
            counter++;
        }
        for (int i = 0; i < r; i++) {
            temp[counter] = Q[i];
            counter++;
        }
      }
      f = 0;
      r = counter;
      Q = temp;
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
