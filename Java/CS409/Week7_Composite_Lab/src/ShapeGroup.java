import java.util.ArrayList;
import java.util.List;

public class ShapeGroup implements Drawable {
    private final String name;
    private final List<Drawable> children = new ArrayList<>();

    public ShapeGroup(String name) {
        this.name = name;
    }

    public void add(Drawable drawable) {
        children.add(drawable);
    }

    @Override
    public void draw(String indent) {
        System.out.println(indent + name);
        for (Drawable child : children) {
            child.draw(indent + "   ");
        }
    }
}
