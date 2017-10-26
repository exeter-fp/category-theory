public class Square implements Shape {

    private float l;

    public Square(float l) {
        this.l = l;
    }

    @Override
    public float area() {
        return l * l;
    }

    @Override
    public float circ() {
        return 4 * l;
    }
}
