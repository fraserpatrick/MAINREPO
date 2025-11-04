## Week 7 – Composite Pattern Lab

### Objective
Learn how the Composite Pattern enables hierarchical structures where individual objects and groups of objects are treated uniformly.

### Scenario
You are designing a simple drawing application. Individual shapes like circles and rectangles can be drawn, and groups of shapes can be nested and drawn together. This models a composite structure where both leaf and composite nodes implement the same interface.

### Pattern Roles
- **Component Interface:** `Drawable`
- **Leaf Classes:** `Circle`, `Rectangle`
- **Composite Class:** `ShapeGroup`
- **Client:** `Main`

### Your Tasks
1. Implement the `Drawable` interface with a `draw(String indent)` method.
2. Create `Circle` and `Rectangle` classes that implement `Drawable`.
3. Create a `ShapeGroup` class that can contain multiple `Drawable` objects.
4. Implement recursive drawing logic in `ShapeGroup`.
5. Use the `Main` class to build and draw a nested structure.
6. Write JUnit tests to verify correct drawing output and structure.

### Reflective Questions
1. What are the pros and cons of treating individual and grouped objects uniformly?
2. How would you extend this system to support transformations (e.g., scaling, rotation)?
3. What challenges might arise when deeply nesting groups?
