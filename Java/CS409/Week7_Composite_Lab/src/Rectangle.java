public class Rectangle implements Drawable {
    private final String name;

    public Rectangle(String name) {
        this.name = name;
    }

    @Override
    public void draw(String indent) {
        System.out.println(indent + name);
    }
}
