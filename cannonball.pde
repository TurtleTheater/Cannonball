Ball b;
float t = 0.0;
PImage bg;

void setup()
{
  size ( 1000, 600 );
  bg = loadImage("Kirby background.png");
  frameRate ( 100 );
  b = new Ball( 0, height - 1, 45, 3 );
}

void draw()
{
  background ( bg );

  t += 1.0 / frameRate;

  b.update();
  b.printInfo ( 170, 35 );

  printTime ( 170, 20 );

  if ( b.getY() >= height )
  {
    noLoop();
  }
}

void printTime( int x, int y )
{
  fill ( 0 );
  text ( "" + nf ( t, 0, 4 ) + " sec", x, y );
}
