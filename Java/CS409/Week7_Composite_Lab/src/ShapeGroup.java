import java.util.ArrayList;
import java.util.List;

public class ShapeGroup implements Drawable {
    private final String name;
    private final List<Drawable> children = new ArrayList<>();

    public ShapeGroup(String name) {
        // TODO: Store the name of the group
    }

    public void add(Drawable drawable) {
        // TODO: Add a drawable to the group
    }

    @Override
    public void draw(String indent) {
        // TODO: Print the group name and recursively draw children with increased indentation
    }
}
