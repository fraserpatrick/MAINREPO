import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class RobotAdapterTest {

    @Test
    public void testTurnConversion() {
        LegacyRobot legacy = new LegacyRobot();
        RobotController controller = new RobotAdapter(legacy);

        controller.turn(180); 
        // converts to π radians, answer should be equal to π.
        assertEquals(Math.PI, legacy.getLastRotation(), 0.0001);
    }

    @Test
    public void testMoveConversion() {
        LegacyRobot legacy = new LegacyRobot();
        RobotController controller = new RobotAdapter(legacy);

        controller.move(2.0);
        // answer should be 2 numbers which equal to 2
        assertEquals(1.0, legacy.getLastSpeed(), 2);
        assertEquals(2.0, legacy.getLastDuration(), 2);
    }

}
