Ball b;

void setup()
{
  size ( 1000, 600 );
  frameRate ( 100 );
  b = new Ball( 0, height - 1, 45, 3 );
}

void draw()
{
  background ( 255 );
  b.update();
  b.printInfo ( 100, 100 );
}
