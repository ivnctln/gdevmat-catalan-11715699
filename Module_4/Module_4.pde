Walker[] walkers = new Walker[100];

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walkers.length; i++) {
    PVector pos = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    float s = random(10, 50);
    walkers[i] = new Walker(pos, s);
  }
}

void draw() {
  background(80);

  for (Walker w : walkers) {
    w.update();
    w.render();
    w.checkEdges();
  }
}
