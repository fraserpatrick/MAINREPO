import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * The test class NodeQueueTests
 */
public class NodeQueueTests
{
     QueueADT<String> q;
     
     /**
     * Sets up the test fixture
     * Called before every test case method.
     */
    @Before
    public void setUp() { 
        q = new NodeQueue<>();
    }
    
    @Test
    public void exists_test() {
        assertNotNull(q);
    }
     
    @Test
    public void isEmpty_test_emptyQ() {
        assertTrue(q.isEmpty());
    }
   
    @Test
    public void size_test_emptyQ() {
        assertEquals(0, q.size());
    }
    
    @Test (expected = EmptyQueueException.class)
    public void dequeue_test_emptyQ() {
        q.dequeue();
    }
     
    @Test (expected = EmptyQueueException.class)
    public void front_test_emptyQ() {
        q.front();
    }   
    
    @Test
    public void enqueue_and_front_test() {
         q.enqueue("AA");
         assertFalse(q.isEmpty());       
         assertEquals(1, q.size());
         assertEquals("AA", q.front());
    }
    
    @Test
    public void front_test() {
         q.enqueue("AA");
         q.enqueue("BB");
         q.enqueue("CC");
         assertFalse(q.isEmpty());       
         assertEquals(3, q.size());
         assertEquals("AA", q.front());
    }
        
    @Test
    public void dequeue_test() {
         q.enqueue("AA");
         q.enqueue("BB");
         q.enqueue("CC");
         assertFalse(q.isEmpty());       
         assertEquals("AA", q.dequeue());
         assertEquals(2, q.size()); 
         assertEquals("BB", q.front());
    }

    @Test
    public void add_remove_add_test() {
        q.enqueue("AA");
        q.enqueue("BB");
        q.enqueue("CC");
        q.dequeue();
        q.dequeue();
        q.dequeue();
        assertTrue(q.isEmpty());
        assertEquals(0, q.size());
        q.enqueue("EE");
        q.enqueue("FF");
        assertEquals("EE", q.front());
    }

    @Test
    public void several_operations_test(){
        q.enqueue("AA");
        q.enqueue("BB");
        q.enqueue("CC");    // add 3 [AA,BB,CC]
        assertEquals(3, q.size()); 
        q.dequeue();        // remove 1 [BB,CC]
        assertEquals(2, q.size());
        q.enqueue("DD");    // add 1   [BB,CC,DD]
        assertEquals(3, q.size());
        q.dequeue(); 
        q.dequeue();        // remove 2 [DD]
        assertEquals("DD", q.front());
        assertEquals(1, q.size());
        assertFalse(q.isEmpty());
        q.dequeue();        // remove 1 []
        assertTrue(q.isEmpty());
        assertEquals(0, q.size());
        q.enqueue("EE"); 
        q.enqueue("FF");    // add 2   [EE,FF]
        assertFalse(q.isEmpty());
        assertEquals(2, q.size());
        assertEquals("EE",q.front());
        assertEquals("EE", q.dequeue());
    }
    
    @Test
    public void several_operations_test2(){
        q.enqueue("AA");
        q.enqueue("BB");
        q.enqueue("CC");    // add 3 [AA,BB,CC]
        q.dequeue();
        q.dequeue();        // remove 2 [CC]
        q.enqueue("DD");
        q.enqueue("EE");
        q.enqueue("FF");
        q.enqueue("GG");    // add 4   [CC,DD,EE,FF,GG]
        assertEquals(5, q.size());
        q.dequeue(); 
        q.dequeue();        // remove 2 [EE,FF,GG]
        assertEquals("EE", q.front());
        assertEquals(3, q.size());
        assertFalse(q.isEmpty());
        q.dequeue(); 
        q.dequeue();
        q.dequeue();       // remove 3 []
        assertTrue(q.isEmpty());
        assertEquals(0, q.size());
        q.enqueue("HH"); 
        q.enqueue("HH");    // add 2   [HH,HH]
        assertFalse(q.isEmpty());
        assertEquals(2, q.size());
        assertEquals("HH", q.front());
        assertEquals("HH", q.dequeue());
    }
}
