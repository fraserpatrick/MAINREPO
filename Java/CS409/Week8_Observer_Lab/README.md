## Week 8 – Observer Pattern Lab

### Objective
Learn how the Observer Pattern allows objects to subscribe to and react to changes in another object, promoting loose coupling and dynamic behavior.

### Scenario
You are building a weather monitoring system. A `WeatherStation` object tracks temperature, humidity, and pressure. Multiple display elements (observers) automatically update when the weather changes.

You should impliment this using the Push model.

### Pattern Roles
- **Publisher:** `WeatherStation` (extends `Observable`)
- **Subscribers:** `CurrentConditionsDisplay`, `StatisticsDisplay`, (implement `Observer`)
- **Client:** `Main`

### Your Tasks
1. Implement the `WeatherStation` class to notify observers when weather data changes.
2. Implement each display class to observe the station and update accordingly.
3. Use the `Main` class to simulate weather updates.

### Reflective Questions
1. How does Java’s built-in `Observable` and `Observer` differ from custom implementations?
2. What challenges might arise when many observers are registered?
3. How would you modify this system to support push vs pull update models?
