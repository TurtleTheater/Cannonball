Ball b;

void setup()
{
  size ( 800, 400 );
  frameRate ( 100 );
  b = new Ball();
}

void draw()
{
  background ( 255 );
  b.update();
  fill ( 0 );
  b.printInfo ( 100, 100 );
}
