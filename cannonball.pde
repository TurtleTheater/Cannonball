Ball b;
float t = 0.0;
PImage bg;
Cannon c;
Ball [] ammo;

void setup()
{
  size ( 1000, 600 );
  bg = loadImage("Kirby background.png");
  frameRate ( 100 );
  c= new Cannon(0,height - 1);
  b = c.fire();
  ammo= new Ball [5];
}

void draw()
{
  background ( bg );

  t += 1.0 / frameRate;

  b.update();
  b.printInfo ( 170, 35 );
  c.draw();

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
