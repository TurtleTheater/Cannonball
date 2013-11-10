Ball b;
Cannon c;
float t = 0.0;
PImage bg;
Ball [] ammo;
int counter=5;

void setup()
{
  size ( 1000, 600 );
  bg = loadImage( "Kirby background.png" );
  frameRate ( 100 );
  c = new Cannon( 50, height-1, 45 );
  b = new Ball( 10000, 10000 );
  ammo= new Ball[ 5 ];
}

void draw()
{
  background ( bg );

  if ( b.getY() < height )
    t += 1.0 / frameRate;

  b.update();
  b.printInfo ( 170, 35 );
  c.draw();
  c.printInfo ( 170, 50 );

  printTime ( 170, 20 );

  if ( b.getY() >= height )
  {
    noLoop();
  }
  score( 170, 65);
}

void keyPressed()
{
  if ( key == 'w' )
    c.aim ( 1 );
  if ( key == 's' )
    c.aim ( -1 );
  if ( key == ' ' )
  {
    b = c.fire ();
    t = 0;
    counter--;
  }
  loop();
}

void printTime( int x, int y )
{
  fill ( 0 );
  text ( "" + nf ( t, 0, 4 ) + " sec", x, y );
}

void score(int t_x, int t_y)
{
textSize ( 12 );
fill ( 0 );
text ( counter, t_x, t_y );
}
