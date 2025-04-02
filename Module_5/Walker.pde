public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;
  public color walkerColor;

  public Walker() {}

  public Walker(float mass, PVector startPos)
  {
    this.mass = mass;
    this.scale = mass * 15;
    this.position = startPos.copy();
    setRandomColor();
  }

  // Newton's Second Law of Motion
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // force accumulation
  }

  public void update()
  {
    this.velocity.add(this.acceleration); // velocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // resets acceleration every frame
  }

  public void render()
  {
    fill(this.walkerColor);
    noStroke();
    circle(position.x, position.y, scale);
  }

  public void setRandomColor()
  {
    this.walkerColor = color(random(255), random(255), random(255));
  }

  public void checkEdges()
  {
    if (this.position.x > Window.right)
    {
      this.position.x = Window.right;
      this.velocity.x *= -1;
    }
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.left;
      this.velocity.x *= -1;
    }

    if (this.position.y > Window.top)
    {
      this.position.y = Window.top;
      this.velocity.y *= -1;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.bottom;
      this.velocity.y *= -1;
    }
  }
}
