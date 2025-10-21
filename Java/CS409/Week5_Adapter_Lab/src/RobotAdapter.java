public class RobotAdapter implements RobotController {
    private final LegacyRobot legacyRobot;

    public RobotAdapter(LegacyRobot legacyRobot) {
        this.legacyRobot = legacyRobot;
    }

    @Override
    public void turn(double degrees) {
        legacyRobot.rotate(degrees * (Math.PI / 180));
    }

    @Override
    public void move(double meters) {
        legacyRobot.accelerate(meters, 1);
    }
}
