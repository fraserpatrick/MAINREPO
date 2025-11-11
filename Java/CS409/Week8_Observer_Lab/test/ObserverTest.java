import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import java.util.Observable;
import java.util.Observer;

public class ObserverTest {

    @Test
    public void testObserverReceivesUpdate() {
        WeatherStation station = new WeatherStation();
        TestObserver observer = new TestObserver();

        station.addObserver(observer);
        station.setMeasurements(25f, 50f, 1000f);

        assertTrue(observer.wasUpdated, "Observer should be notified of update");
    }

    @Test
    public void testObserverRemovedDoesNotReceiveUpdate() {
        WeatherStation station = new WeatherStation();
        TestObserver observer = new TestObserver();

        station.addObserver(observer);
        station.deleteObserver(observer);
        station.setMeasurements(20f, 40f, 990f);

        assertFalse(observer.wasUpdated, "Removed observer should not be notified");
    }

    // Simple inner class to track if update() was called
    static class TestObserver implements Observer {
        boolean wasUpdated = false;

        @Override
        public void update(Observable o, Object arg) {
            wasUpdated = true;
        }
    }
}
