public class Main {
    public static void main(String[] args) {
        NotificationFactory emailFactory = new EmailFactory();
        NotificationFactory smsFactory = new SMSFactory();
        NotificationFactory pushFactory = new PushFactory();

        Notification emailNotification = emailFactory.createNotification();
        Notification smsNotification = smsFactory.createNotification();
        Notification pushNotification = pushFactory.createNotification();

        emailNotification.send("Hello world!");
        smsNotification.send("Hola world!");
        pushNotification.send("Bonjour world!");
    }
}