public abstract class PrinterDecorator implements Printer {
    protected Printer wrappedPrinter;

    public PrinterDecorator(Printer wrappedPrinter) {
        this.wrappedPrinter = wrappedPrinter;
    }

    @Override
    public String print(String input) {
        return wrappedPrinter.print(input);
    }
}
