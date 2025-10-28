public class BorderPrinter extends PrinterDecorator {
    public BorderPrinter(Printer wrappedPrinter) {
        super(wrappedPrinter);
    }

    @Override
    public String print(String input) {
        return "* " + super.print(input) + " *";
    }
}
