public class HtmlPrinter extends PrinterDecorator {
    public HtmlPrinter(Printer wrappedPrinter) {
        super(wrappedPrinter);
    }

    @Override
    public String print(String input) {
        return "<html><body><p>" + super.print(input) + "</p></body></html>";
    }
}
