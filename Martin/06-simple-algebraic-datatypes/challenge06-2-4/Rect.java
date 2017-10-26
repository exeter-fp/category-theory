public class Rect implements Shape {

    private float d;
    private float h;

    public Rect(float d, float h) {
        this.d = d;
        this.h = h;
    }

    @Override
    public float area() {
        return d * h;
    }

    @Override
    public float circ() {
        return 2 * (d + h);
    }
}
