public class DLNode<E> {

  // Instance variables:
  private E element;
  private DLNode<E> next;
  private DLNode<E> prev;

  /** Creates a node with null references to its 
   *  element,previous and next nodes. 
  */
  public DLNode() {
    this(null, null, null);
  }

  /** Creates a node with the given element, previous
   *  and next nodes. 
  */
  public DLNode(E e, DLNode<E> p, DLNode<E> n) {
    element = e;
    next = n;
    prev = p;
  }

  // Accessor methods:
  public E getElement() {
    return element; 
  }
  public DLNode<E> getNext() { 
    return next;
  }
  public DLNode<E> getPrev() { 
    return prev;
  }

  // Mutator methods:
  public void setElement(E newElem) { 
    element = newElem; 
  }
  public void setNext(DLNode<E> newNext) {
    next = newNext; 
  }
  public void setPrev(DLNode<E> newPrev) {
    prev = newPrev; 
  }
}

