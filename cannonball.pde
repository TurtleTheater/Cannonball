Ball b;
Cannon c;
float t = 0.0;
PImage bg;

void setup()
{
  size ( 1000, 600 );
  bg = loadImage("Kirby background.png");
  frameRate ( 100 );
  b = new Ball( 0, height - 1, 45, 3 );
  c = new Cannon();
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

void keyPressed
{
  if (key == 'w')
  c.rotate (.1);
  if (key == 's')
  c.rotate (-.1);
  if (key == ' ')
  c.fire ();
}

void printTime( int x, int y )
{
  fill ( 0 );
  text ( "" + nf ( t, 0, 4 ) + " sec", x, y );
}
