class PWindow extends PApplet {
  private Graph g;
  private ArrayList a;
  private ArrayList b;
  PWindow(Graph g, ArrayList a, ArrayList b) {
    super();
    this.a=a;
    this.b=b;
    this.g=g;
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  void settings() {
    size(800, 600);
  }

  void setup() {
    g.unitMeasure(a,b);
  }

  void draw() {
    noLoop();
  }

}