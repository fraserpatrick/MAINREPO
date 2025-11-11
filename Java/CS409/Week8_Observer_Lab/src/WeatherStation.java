import java.util.Observable;

public class WeatherStation extends Observable {
    private float temperature;
    private float humidity;
    private float pressure;

    public void setMeasurements(float temperature, float humidity, float pressure) {
        // TODO: Update internal state and notify observers
    }

    // TODO: Add getters for temperature, humidity, and pressure
}
