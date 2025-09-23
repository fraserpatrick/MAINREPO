import java.util.Iterator;
import java.util.ArrayList;
import java.util.List;

public class BookShelf implements Iterable<Book> {
    private final List<Book> books = new ArrayList<>();

    public void addBook(Book book) {
        books.add(book);
    }

    @Override
    public Iterator<Book> iterator() {
        // TODO: Return an instance of your custom iterator
        return null;
    }
}
