import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class PizzaBuilderTest {

    @Test
    public void testBuildBasicPizza() {
        Pizza pizza = new CustomPizzaBuilder()
                .setCrust("Thin")
                .setSauce("Pesto")
                .addCheese()
                .build();

        assertNotNull(pizza);
        assertTrue(pizza.toString().contains("crust='Thin'"));
        assertTrue(pizza.toString().contains("sauce='Pesto'"));
        assertTrue(pizza.toString().contains("cheese=true"));
    }

    @Test
    public void testBuildGlutenFreePizza() {
        Pizza pizza = new CustomPizzaBuilder()
                .setGlutenFree(true)
                .build();

        assertTrue(pizza.toString().contains("glutenFree=true"));
    }
}
