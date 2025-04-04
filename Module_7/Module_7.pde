Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    float spacing = (Window.right - Window.left) / (walkers.length + 1);
    float posX = Window.left + spacing * (i + 1);
    
    walkers[i].position = new PVector(posX, Window.top + 50);
    walkers[i].mass = 10 - i;
    walkers[i].scale = walkers[i].mass * 10;
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
  }
}


void draw()
{
  background(255);
  ocean.render();
  
  for (int i = 0; i < walkers.length; i++)
  {
    Walker w = walkers[i];
    
    w.render();
    w.update();
    
    PVector wind = new PVector(0.1, 0);
    w.applyForce(wind);

    PVector gravity = new PVector(0, -0.15f * w.mass);
    w.applyForce(gravity);
    
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));

    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }

    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
  }
}
