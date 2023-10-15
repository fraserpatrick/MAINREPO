/**
 * This class is for completion in Practical 3iii
 * The Node class is supplied for you
*/
public class NodeQueue<E> implements QueueADT<E>
{
    // references to the head and tail of 
    // the linked list
    protected Node<E> head, tail;   
    // number of elements in the queue
    protected int size;     

    /** constructs an empty queue
    */
    public NodeQueue() {    
       head = null; tail = null;
       size = 0;
    }
    
   // Complete the method bodies below. Take care
   // that exceptions of the correct types are thrown by 
   // your methods as specified in the method comments.
   
    public int size() { 
    }
    
    public boolean isEmpty() {
    }
    
    public void enqueue(E elem) {
    // create and link in a new node at tail
    }

    /**
     @throws EmptyQueueException
    */
    public E front() {
    }

    /**
     @throws EmptyQueueException
    */
    public E dequeue() {
    }
}
