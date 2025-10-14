public class CustomPizzaBuilder implements PizzaBuilder {
    private String crust;
    private String sauce = "None";
    private boolean cheese;
    private boolean pepperoni;
    private boolean mushrooms;
    private boolean glutenFree;

    @Override
    public PizzaBuilder setCrust(String crust) {
        this.crust = crust;
        return this;
    }

    @Override
    public PizzaBuilder setSauce(String sauce) {
        this.sauce = sauce;
        return this;
    }

    @Override
    public PizzaBuilder addCheese() {
        this.cheese = true;
        return this;
    }

    @Override
    public PizzaBuilder addPepperoni() {
        this.pepperoni = true;
        return this;
    }

    @Override
    public PizzaBuilder addMushrooms() {
        this.mushrooms = true;
        return this;
    }

    @Override
    public PizzaBuilder setGlutenFree(boolean glutenFree) {
        this.glutenFree = glutenFree;
        return this;
    }

    @Override
    public Pizza build() {
        Pizza pizza = new Pizza(crust, sauce, cheese, pepperoni, mushrooms, glutenFree);
        return pizza;
    }
}