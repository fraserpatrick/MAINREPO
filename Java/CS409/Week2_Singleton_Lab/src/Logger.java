import java.time.LocalDateTime;

public class Logger {
    private static Logger inst;

    private Logger(){}

    public static Logger getInstance(){
        if (inst == null){
            inst = new Logger();
        }
        return inst;
    }

    public void log(String message) {
        System.out.println(LocalDateTime.now() + " " + message);
    }
}