import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class NotificationFactoryTest {

    @Test
    public void testEmailFactoryCreatesEmailNotification() {
        NotificationFactory factory = new EmailFactory();
        Notification notification = factory.createNotification();
        assertTrue(notification instanceof EmailNotification);
    }

    @Test
    public void testSMSFactoryCreatesSMSNotification() {
        NotificationFactory factory = new SMSFactory();
        Notification notification = factory.createNotification();
        assertTrue(notification instanceof SMSNotification);
    }

    @Test
    public void testPushFactoryCreatesPushNotification() {
        NotificationFactory factory = new PushFactory();
        Notification notification = factory.createNotification();
        assertTrue(notification instanceof PushNotification);
    }
}
