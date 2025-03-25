public class Walker
{
  public float x, y;
  public float s;
  public float r, g, b;
  
  public float tx = 0, ty = 10000;
  public float ts = 20000;
  public float tr = 30000, tg = 40000, tb = 50000;
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    s = map(noise(ts), 0, 1, 5, 150);
    
    r = map(noise(tr), 0, 1, 0, 255);
    g = map(noise(tg), 0, 1, 0, 255);
    b = 255;

    tx += 0.01f;
    ty += 0.01f;
    ts += 0.01f;
    tr += 0.01f;
    tg += 0.01f;
    tb += 0.01f;
  }
}
