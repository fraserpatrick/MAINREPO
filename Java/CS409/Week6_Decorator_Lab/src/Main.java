public class Main {
    public static void main(String[] args) {
        Printer printer = new BasicPrinter();

        printer = new HtmlPrinter(new TimestampPrinter(new BorderPrinter(new UpperCasePrinter(printer))));

        System.out.println(printer.print("Hello World!"));
    }
}
