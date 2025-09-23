public class Main {
    public static void main(String[] args) {
        BookShelf shelf = new BookShelf();
        shelf.addBook(new Book("1984", "George Orwell"));
        shelf.addBook(new Book("Brave New World", "Aldous Huxley"));
        shelf.addBook(new Book("Seven Pillars of Wisdom", "T. E. Lawrence"));

        // TODO: Use a for-each loop to print book titles using your iterator
    }
}
