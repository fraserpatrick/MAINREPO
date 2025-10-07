import java.time.LocalDateTime;

public class PushNotification implements Notification {
    @Override
    public void send(String message) {
        System.out.println("Push notification at, " + LocalDateTime.now() + ": " + message);
    }
}