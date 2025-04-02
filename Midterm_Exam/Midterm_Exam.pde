Mover blackHole;
Mover[] matter = new Mover[150];

void setup()
{
  size(1920, 1080, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  init();
}

void draw()
{
  background(0);

  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  blackHole.position = new PVector(x, y);

  noStroke();

  for (int i = 0; i < matter.length; i++)
  {
    Mover m = matter[i];

    PVector direction = PVector.sub(blackHole.position, m.position);
    direction.normalize();
    direction.mult(5);

    m.position.add(direction);
    m.render();
  }
  
  blackHole.render();

  if (frameCount % 300 == 0)
  {
    init();
  }
}

void init()
{
  float bhX = random(-Window.windowWidth, Window.windowWidth);
  float bhY = random(-Window.windowHeight, Window.windowHeight);
  blackHole = new Mover(bhX, bhY, 50);
  blackHole.setColor(255, 255, 255, 255);

  for (int i = 0; i < matter.length; i++)
  {
    float mx = (float)(randomGaussian() * Window.windowWidth / 4);
    float my = (float)(randomGaussian() * Window.windowHeight / 4);
    matter[i] = new Mover(mx, my, random(5, 25));
    matter[i].setColor(random(255), random(255), random(255), random(50, 255));
  }
}
