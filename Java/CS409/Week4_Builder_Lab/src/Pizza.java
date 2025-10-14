public class Pizza {
    private String crust;
    private String sauce;
    private boolean cheese;
    private boolean pepperoni;
    private boolean mushrooms;
    private boolean glutenFree;

    public Pizza(String crust, String sauce, boolean cheese, boolean pepperoni, boolean mushrooms, boolean glutenFree) {
        this.crust = crust;
        this.sauce = sauce;
        this.cheese = cheese;
        this.pepperoni = pepperoni;
        this.mushrooms = mushrooms;
        this.glutenFree = glutenFree;
    }

    @Override
    public String toString() {
        return "Pizza{" + 
            "crust='" + crust + "\'" +
            ", sauce='" + sauce + "\'" +
            ", cheese=" + cheese +
            ", pepperoni=" + pepperoni +
            ", mushrooms=" + mushrooms +
            ", glutenFree=" + glutenFree +"}";
    }
}