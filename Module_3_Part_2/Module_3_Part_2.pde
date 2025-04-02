void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);;
  
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(130);

  PVector mouse = mousePos();
  mouse.normalize().mult(350);

  //red outer glow
  strokeWeight(15);
  stroke(255, 0, 0, 100);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);

  // white inner core
  strokeWeight(6);
  stroke(255);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);

  // handle
  float angle = atan2(mouse.y, mouse.x);
  pushMatrix();
  translate(0, 0);
  rotate(angle);
  strokeWeight(20);
  stroke(0);
  line(-40, 0, 40, 0);
  popMatrix();

  println(mouse.mag());
}
