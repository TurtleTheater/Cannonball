Ball b;

void setup()
{
  size ( 500, 300 );
  frameRate ( 100 );
  b = new Ball();
}

void draw()
{
  background ( 255 );
  b.update();
}


