void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker vectorWalker = new Walker();

void draw()
{
  background(255);
  fill(182, 52, 100);
  circle(vectorWalker.position.x, vectorWalker.position.y, 50);
  vectorWalker.moveAndBounce();
}
