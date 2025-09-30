import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import java.io.*;

public class LoggerTest {

    @Test
    public void testSingletonInstance() {
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();
        assertSame(logger1, logger2, "Logger instances should be the same");
    }

@Test
public void testLogOutput() {
    Logger logger = Logger.getInstance();

    ByteArrayOutputStream outContent = new ByteArrayOutputStream();
    System.setOut(new PrintStream(outContent));

    logger.log("Test message");

    assertTrue(outContent.toString().contains("Test message"));
}
}
