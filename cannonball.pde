Ball b;

void setup()
{
  size ( 500, 300 );
  frameRate ( 100 );
  b = new Ball();
  noLoop();
}

void draw()
{
  b.update();
}


