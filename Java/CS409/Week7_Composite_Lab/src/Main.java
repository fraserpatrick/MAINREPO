public class Main {
    public static void main(String[] args) {
        Circle circle1 = new Circle("Circle 1");
        Circle circle2 = new Circle("Circle 2");
        Rectangle rectangle1 = new Rectangle("Rectangle 1");
        Rectangle rectangle2 = new Rectangle("Rectangle 2");

        ShapeGroup group1 = new ShapeGroup("Group 1");
        group1.add(circle1);
        group1.add(rectangle1);

        ShapeGroup group2 = new ShapeGroup("Group 2");
        group2.add(circle2);
        group2.add(rectangle2);

        ShapeGroup mainGroup = new ShapeGroup("Main Group");
        mainGroup.add(group1);
        mainGroup.add(group2);
        mainGroup.draw("");
    }
}