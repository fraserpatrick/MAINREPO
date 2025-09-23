# Week 1 – Iterator Pattern (Starter Task, Not Assessed)

## Objective
Learn how to use the Iterator design pattern to traverse a custom collection without exposing its internal structure.

## Task
You will implement a `BookShelfIterator` class that allows iteration over a `BookShelf` collection of `Book` objects.
You may use the java iterator built in.

### Provided Files
- `Book.java`: A partially implemented class representing a book.
- `BookShelf.java`: A collection class with an incomplete `iterator()` method.
- `BookShelfIterator.java`: Empty file to be implemented.
- `Main.java`: A demo file to test your implementation.
- `BookShelfTest.java`: JUnit tests to verify your implementation.

### Your Tasks

2. Implement the `BookShelfIterator` class:
   - It should implement `Iterator<Book>`.
   - It should support forward traversal of the bookshelf.

3. Complete the `iterator()` method in `BookShelf.java` to return an instance of your iterator.

4. Run the provided JUnit tests to verify your implementation.

5. Write a small demo in `Main.java` that adds books to a shelf and prints them using a `for-each` loop.

## Reflective Questions
Answer the following questions after completing the task:
1. Why is it beneficial to use an iterator instead of exposing the internal list directly?
2. How would you modify the iterator to support reverse traversal?
3. What are the limitations of this iterator implementation, and how could you improve it (e.g., thread safety, fail-fast behavior)?
