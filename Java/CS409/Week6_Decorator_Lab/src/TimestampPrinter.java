import java.time.LocalDateTime;

public class TimestampPrinter extends PrinterDecorator {
    public TimestampPrinter(Printer wrappedPrinter) {
        super(wrappedPrinter);
    }

    @Override
    public String print(String input) {
        return "[" + LocalDateTime.now() + "]" + super.print(input);
    }
}
