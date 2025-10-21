public class Main {
    public static void main(String[] args) {
        LegacyRobot legacyRobot = new LegacyRobot();

        RobotAdapter robotAdapter = new RobotAdapter(legacyRobot);

        robotAdapter.turn(90);
        robotAdapter.move(20);
    }
}