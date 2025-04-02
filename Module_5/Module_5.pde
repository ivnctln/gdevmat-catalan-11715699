Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walkers.length; i++)
  {
    float mass = i + 1;
    walkers[i] = new Walker(mass, new PVector(-500, 200));
  }
}

void draw()
{
  background(80);

  for (int i = 0; i < walkers.length; i++)
  {
    Walker w = walkers[i];
    w.render();
    w.update();
    w.applyForce(wind);
    w.applyForce(gravity);
    
    if (w.position.x >= Window.right || w.position.x <= Window.left)
    {
      w.velocity.x *= -1;
    }

    if (w.position.y <= Window.bottom || w.position.y >= Window.top)
    {
      w.velocity.y *= -1;
    }
  }
}
