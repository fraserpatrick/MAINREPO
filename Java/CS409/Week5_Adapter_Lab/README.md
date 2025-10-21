# Week 5 – Adapter Pattern Lab: Robot Control Adapter

## Objective
Learn how to use the Adapter design pattern to bridge incompatible interfaces. Adapt a legacy robot control system to work with a modern controller interface.

## Scenario
You are integrating a new robot controller that issues commands in degrees and meters. However, the existing robot hardware only understands radians and acceleration-based movement.

### New Controller Interface
- `turn(double degrees)` — turns the robot by a specified number of degrees.
- `move(double meters)` — moves the robot forward by a specified distance.

### Legacy Robot Interface
- `rotate(double radians)` — rotates the robot by a specified number of radians.
- `accelerate(double speed, double duration)` — moves the robot using speed and duration.

## Your Task
Implement a `RobotAdapter` class that adapts the `RobotController` interface to the `LegacyRobot` class.

### Technical Guidance
- **Degrees to Radians Conversion**:  
  `radians = degrees × π / 180`

- **Basic Acceleration Formula**:  
  Assume constant speed:  
  `distance = speed × duration`  


## Pattern Roles
- **Target (Expected Interface):** `RobotController` — defines `turn()` and `move()` methods.
- **Adaptee (Legacy Interface):** `LegacyRobot` — defines `rotate()` and `accelerate()`.
- **Adapter:** `RobotAdapter` — implements `RobotController` and delegates to `LegacyRobot`.
- **Client:** `Main` — uses `RobotController` to issue commands.

## Reflective Questions
1. What are the pros and cons of using an adapter versus rewriting the legacy class?
2. How does the Adapter pattern help with integrating third-party or legacy systems?
3. How would you handle adapting more complex behaviors, like obstacle avoidance or path planning? Would you still use an adapter?
