Ball b;
float t = 0.0;

void setup()
{
  size ( 1000, 600 );
  frameRate ( 100 );
  b = new Ball( 0, height - 1, 45, 3 );
}

void draw()
{
  background ( 255 );

  t += 1.0 / frameRate;

  b.update();
  b.printInfo ( 100, 100 );

  printTime ( 100, 80 );

  if ( b.getY() >= height )
  {
    noLoop();
  }
}

void printTime( int x, int y )
{
  text ( "" + nf ( t, 0, 4 ) + " sec", x, y );
}
