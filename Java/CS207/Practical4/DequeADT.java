
public interface DequeADT<E> {
 /**
  * Returns the number of elements in the deque.
  */
  public int size();

 /** 
  * Returns whether the deque is empty.
  */
  public boolean isEmpty();

 /**
  * Inserts an element to be the first in the deque.
  */
  public void addFirst (E element); 

 /**
  * Inserts an element to be the last in the deque.
  */
  public void addLast (E element); 

 /** 
  * Returns the first element 
  * @throws EmptyDequeException
  */
  public E getFirst();

 /** 
  * Returns the last element; 
  * @throws EmptyDequeException
  */
  public E getLast();


 /** 
  * Removes the first element
  * @throws EmptyDequeException
  */
  public E removeFirst();

 /** 
  * Removes the last element
  * @throws EmptyDequeException
  */
  public E removeLast();
}

