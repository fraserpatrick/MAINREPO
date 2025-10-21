public class RobotAdapter implements RobotController {
    private final LegacyRobot legacyRobot;

    public RobotAdapter(LegacyRobot legacyRobot) {
        this.legacyRobot = legacyRobot;
    }

    @Override
    public void turn(double degrees) {
        // TODO: Convert degrees to radians and call legacyRobot.rotate()
    }

    @Override
    public void move(double meters) {
        // TODO: Calculate a speed and acceleration which, when multipled together, will equal meters, then call legacyRobot.accelerate()
    }
}
