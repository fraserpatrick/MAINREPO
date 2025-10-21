public class LegacyRobot {
    private double lastRotation;
    private double lastSpeed;
    private double lastDuration;

    public void rotate(double radians) {
        this.lastRotation = radians;
        System.out.println("Rotating " + radians + " radians");
    }

    public void accelerate(double speed, double duration) {
        this.lastSpeed = speed;
        this.lastDuration = duration;
        System.out.println("Accelerating at " + speed + " m/s for " + duration + " seconds");
    }

    public double getLastRotation() {
        return lastRotation;
    }

    public double getLastSpeed() {
        return lastSpeed;
    }

    public double getLastDuration() {
        return lastDuration;
    }
}
