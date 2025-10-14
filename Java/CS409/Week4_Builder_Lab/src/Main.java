public class Main {
    public static void main(String[] args) {
        Pizza pizza = new CustomPizzaBuilder().setCrust("Stuffed").addCheese().addPepperoni().build();
        System.out.println(pizza);
    }
}
