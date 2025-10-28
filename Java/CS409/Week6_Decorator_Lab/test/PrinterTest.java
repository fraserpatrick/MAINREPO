import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDateTime;

public class PrinterTest {

    @Test
    public void testBasicPrinter() {
        Printer printer = new BasicPrinter();
        assertEquals("hello", printer.print("hello"));
    }

    @Test
    public void testUpperCasePrinter() {
        Printer printer = new UpperCasePrinter(new BasicPrinter());
        assertEquals("HELLO", printer.print("hello"));
    }

    @Test
    public void testTimestampPrinter() {
        Printer printer = new TimestampPrinter(new BasicPrinter());
        String result = printer.print("hello");
        assertTrue(result.matches("\[.*\] hello"));
    }

    @Test
    public void testHtmlPrinter() {
        Printer printer = new HtmlPrinter(new BasicPrinter());
        String expected = "<html><body><p>hello</p></body></html>";
        assertEquals(expected, printer.print("hello"));
    }

    @Test
    public void testStackedDecorators() {
        Printer printer = new HtmlPrinter(
                            new TimestampPrinter(
                                new BorderPrinter(
                                    new UpperCasePrinter(
                                        new BasicPrinter()
                                    )
                                )
                            )
                        );
        String result = printer.print("hello");
        assertTrue(result.startsWith("<html><body><p>["));
        assertTrue(result.contains("* HELLO *"));
        assertTrue(result.endsWith("</p></body></html>"));
    }
}
