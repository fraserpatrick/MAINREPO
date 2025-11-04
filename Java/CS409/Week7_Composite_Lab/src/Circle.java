public class Circle implements Drawable {
    private final String name;

    public Circle(String name) {
        this.name = name;
    }

    @Override
    public void draw(String indent) {
        System.out.println(indent + name);
    }
}
