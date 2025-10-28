public class UpperCasePrinter extends PrinterDecorator {
    public UpperCasePrinter(Printer wrappedPrinter) {
        super(wrappedPrinter);
    }

    @Override
    public String print(String input) {
        return super.print(input).toUpperCase();
    }
}