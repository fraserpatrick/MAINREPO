# Week 4 – Builder Pattern Lab: Pizza Builder

## Objective
Learn how to use the Fluent Builder design pattern to construct complex objects step-by-step using method chaining.

## Task
You will implement a `PizzaBuilder` that allows building a `Pizza` object with optional ingredients and configurations.

### Provided Files
- `Pizza.java`: The product class representing a pizza.
- `PizzaBuilder.java`: The builder interface.
- `CustomPizzaBuilder.java`: A concrete builder class.
- `Main.java`: A demo file with TODOs.
- `PizzaBuilderTest.java`: JUnit tests to verify your implementation.

### Your Tasks
1. Implement the `Pizza` class with fields for crust, sauce, cheese, pepperoni, mushrooms, and gluten-free base.
2. Implement the `PizzaBuilder` interface with methods to set each ingredient and a `build()` method.
3. Implement the `CustomPizzaBuilder` class using method chaining.
4. Complete the demo in `Main.java` to build and print a pizza.
5. Run the JUnit tests to verify your implementation.

## Pattern Roles
- **Builder (interface):** `PizzaBuilder` — Defines the steps to build a pizza.
- **Concrete Builder:** `CustomPizzaBuilder` — Implements the builder interface and constructs the pizza.
- **Product:** `Pizza` — The complex object being built.
- **Client:** `Main` — Uses the builder to construct a pizza.

## Reflective Questions
1. Why is the Builder pattern more appropriate here than using a constructor with many parameters?
2. How does method chaining of the fluent builder improve readability and maintainability?
3. How would you extend this builder to support validation (e.g., no cheese on vegan pizzas)?
