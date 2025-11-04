import org.junit.jupiter.api.Test;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.*;

public class DrawableTest {

    @Test
    public void testCircleDraw() {
        Circle circle = new Circle("Circle A");
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        System.setOut(new PrintStream(out));
        circle.draw("");
        assertTrue(out.toString().contains("Circle A"));
    }

    @Test
    public void testRectangleDraw() {
        Rectangle rectangle = new Rectangle("Rectangle B");
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        System.setOut(new PrintStream(out));
        rectangle.draw("  ");
        assertTrue(out.toString().contains("Rectangle B"));
    }

    @Test
    public void testShapeGroupDraw() {
        ShapeGroup group = new ShapeGroup("Group 1");
        group.add(new Circle("Circle A"));
        group.add(new Rectangle("Rectangle B"));

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        System.setOut(new PrintStream(out));
        group.draw("");

        String output = out.toString();
        assertTrue(output.contains("Group 1"));
        assertTrue(output.contains("Circle A"));
        assertTrue(output.contains("Rectangle B"));
    }
}
