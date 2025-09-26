public class Main {
    public static void main(String[] args) {
        BookShelf shelf = new BookShelf();
        shelf.addBook(new Book("1984", "George Orwell"));
        shelf.addBook(new Book("Brave New World", "Aldous Huxley"));
        shelf.addBook(new Book("Seven Pillars of Wisdom", "T. E. Lawrence"));

        for (Book book : shelf) {
            System.out.println(book.getTitle() + " by " + book.getAuthor());
        }
    }
}
