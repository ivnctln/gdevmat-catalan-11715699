public class Walker
{
  public PVector position;
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float velocityLimit = 10;
  public float scale;

  public Walker(PVector pos, float s)
  {
    this.position = pos.copy();
    this.scale = s;
  }

  public void update()
  {
    PVector mouse = screenToWorld(mouseX, mouseY);
    PVector direction = PVector.sub(mouse, position);
    direction.normalize();
    direction.mult(0.2);
    this.acceleration = direction;

    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }

  public void render()
  {
    pushMatrix();
    translate(position.x, position.y);
    noStroke(); 
    circle(0, 0, scale);
    popMatrix();
  }

  public void checkEdges()
  {
    if (this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }

  public PVector screenToWorld(float x, float y)
  {
    float worldX = map(x, 0, width, Window.left, Window.right);
    float worldY = map(y, 0, height, Window.top, Window.bottom);
    return new PVector(worldX, worldY);
  }
}
