Walker[] walkers = new Walker[8];

PVector wind = new PVector(0.15, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walkers.length; i++)
  {
    float posY = 2 * (Window.windowHeight / walkers.length) * (i - (walkers.length / 2));
    
    walkers[i] = new Walker();
    walkers[i].position = new PVector(Window.left, posY);
    walkers[i].mass = 10 - i;
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].setRandomColor();
  }
}

void draw()
{
  background(255);
  stroke(0);
  strokeWeight(5);
  line(0, Window.top, 0, Window.bottom);
  noStroke();
  
  for (Walker w : walkers)
  {
    float mew = 0.01f;
      if (w.position.x > 0)
      {
        mew = 0.4f;
      }
      
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);

    PVector acceleration = new PVector(0.05, 0);
    PVector force = PVector.mult(acceleration, w.mass);

    w.update();
    w.render();
    w.applyForce(force);

    if (w.position.x >= Window.right)
    {
      w.position.x = Window.right;
      w.velocity.x *= -1;
    }

    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
  }
}

void mousePressed()
{
  for (int i = 0; i < walkers.length; i++)
  {
    float posY = 2 * (Window.windowHeight / walkers.length) * (i - (walkers.length / 2));

    walkers[i] = new Walker();
    walkers[i].position = new PVector(Window.left, posY);
    walkers[i].mass = 10 - i;
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].setRandomColor();
  }
}
