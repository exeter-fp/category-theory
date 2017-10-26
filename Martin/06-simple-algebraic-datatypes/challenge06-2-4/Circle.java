public class Circle implements Shape {

    private float r;

    public Circle(float r) {
        this.r = r;
    }

    @Override
    public float area() {
        return (float)Math.PI * r * r;
    }

    @Override
    public float circ() {
        return (float)Math.PI * 2 * r;
    }
}
