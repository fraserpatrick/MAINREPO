import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import java.util.Iterator;

public class BookShelfTest {

    @Test
    public void testIteratorReturnsBooksInOrder() {
        BookShelf shelf = new BookShelf();
        shelf.addBook(new Book("Book A", "Author A"));
        shelf.addBook(new Book("Book B", "Author B"));

        Iterator<Book> iterator = shelf.iterator();
        assertTrue(iterator.hasNext());
        assertEquals("Book A", iterator.next().getTitle());
        assertTrue(iterator.hasNext());
        assertEquals("Book B", iterator.next().getTitle());
        assertFalse(iterator.hasNext());
    }

    @Test
    public void testEmptyShelfIterator() {
        BookShelf shelf = new BookShelf();
        Iterator<Book> iterator = shelf.iterator();
        assertFalse(iterator.hasNext());
    }

    @Test
    public void testSingleBookShelfIterator() {
        BookShelf shelf = new BookShelf();
        shelf.addBook(new Book("Solo Book", "Solo Author"));
        Iterator<Book> iterator = shelf.iterator();
        assertTrue(iterator.hasNext());
        assertEquals("Solo Book", iterator.next().getTitle());
        assertFalse(iterator.hasNext());
    }
}
