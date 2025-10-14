public interface PizzaBuilder {
    public PizzaBuilder setCrust(String crust);

    public PizzaBuilder setSauce(String sauce);

    public PizzaBuilder addCheese();

    public PizzaBuilder addPepperoni();

    public PizzaBuilder addMushrooms();

    public PizzaBuilder setGlutenFree(boolean glutenFree);

    public Pizza build();
}