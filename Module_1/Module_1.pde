int amplitude = 50;
int frequency = 5;
int time = 0;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(0);
  
  circle(0, 0, 5);
  
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave(); 
  
  time++;
}

void drawCartesianPlane()
{
  strokeWeight(2);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{
  /*
    f(x) = -5x + 30
    Let x = -3, then y = 45    (-3, 45)
    Let x = 4, then y = 10     (4, 10)
  */

  color purple = color(128, 0, 128);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, (-5*x + 30), 5);
  }
}


void drawQuadraticFunction()
{
  /*
    f(x) = x^2 - 15x - 3
    Let x be 2, then y = 4 - 30 - 3 = -29
    Let x be 10, then y = 100 - 150 - 3 = -53
  */
  
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -200; x <= 200; x += 0.1f)
  {
    circle(x, (x*x - 15*x - 3), 5);
  }
}

void drawSineWave()
{
  color blue = color(0, 0, 255);
  fill(blue);
  stroke(blue);

  for (int x = -300; x <= 300; x += 1)
  {
    circle(x, amplitude * sin((x * (frequency / 100.0)) + (time / 10.0)), 5);
  }
}

void keyPressed()
{
  if (key == 'w') amplitude += 5;
  if (key == 's') amplitude -= 5;
  if (key == 'd') frequency += 1;
  if (key == 'a') frequency -= 1;
}
