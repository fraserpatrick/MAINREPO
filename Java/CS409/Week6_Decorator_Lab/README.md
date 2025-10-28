## Week 6 – Decorator Pattern Lab

### Objective
Learn how the Decorator Pattern allows behavior to be added to individual objects dynamically, promoting flexibility and adherence to the Open/Closed Principle.

### Scenario
You are designing a printing system where different types of printers can format strings in various ways. Instead of creating many subclasses, you’ll use decorators to add features like uppercase conversion, borders, timestamps, and HTML formatting.

### Pattern Roles
- **Component (Interface):** `Printer`
- **Concrete Component:** `BasicPrinter`
- **Base Decorator:** `PrinterDecorator`
- **Concrete Decorators:** `UpperCasePrinter`, `BorderPrinter`, `TimestampPrinter`, `HtmlPrinter`
- **Client:** `Main`

### Your Tasks
1. Implement the `Printer` interface and the `BasicPrinter` class.
2. Create a base decorator class `PrinterDecorator` that wraps a `Printer`.
3. Implement each concrete decorator class to modify the output of the wrapped printer.
4. Compose multiple decorators to produce layered formatting.
5. Use the `Main` class to demonstrate different combinations of decorators.

### Reflective Questions
1. What advantages does the Decorator Pattern offer over subclassing?
2. What challenges might arise when stacking multiple decorators?
3. Could this pattern be used for input validation or logging? Why or why not?
