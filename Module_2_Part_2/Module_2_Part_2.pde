void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  if (frameCount % 300 == 0)
  {
    background(0);
  }
  
  float xGaussian = randomGaussian();
  float xStandardDeviation = 150;
  float xMean = 0;
  float x = xStandardDeviation * xGaussian + xMean;
  
  float y = random(-height/2, height/2);
  
  float gaussian = randomGaussian();
  float standardDeviation = 20;
  float mean = 20;
  float circleSize = standardDeviation * gaussian + mean;
  
  float r = random(256);
  float g = random(256);
  float b = random(256);
  float a = random(10, 101);
  
  noStroke();
  fill(r, g, b, a);
  circle(x, y, circleSize);
}
