Ball b;

void setup()
{
  size ( 1000, 600 );
  frameRate ( 100 );
  b = new Ball( 0, height, 45, 10 );
}

void draw()
{
  background ( 255 );
  b.update();
  fill ( 0 );
  b.printInfo ( 100, 100 );
}
