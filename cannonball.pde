Ball b;
Cannon c;
float t = 0.0;
PImage bg;
ArrayList<Ball> ammo;


void setup()
{
  size ( 1000, 600 );
  bg = loadImage( "Kirby background.png" );
  frameRate ( 100 );
  c = new Cannon( 50, height-1, 45 );
  b = new Ball( 10000, 10000 );
  ammo= new ArrayList<Ball>();
}

void draw()
{
  background ( bg );

  if ( b.getY() < height )
    t += 1.0 / frameRate;

  c.draw();
  c.printInfo ( 170, 50 );
  for(int i=0;i<ammo.size();i++)
  {
    ammo.get(i).update();
  }
  

  printTime ( 170, 20 );

  if ( b.getY() >= height )
  {
    noLoop();
  }
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
    ammo.add(b);
    println(ammo);
    t = 0;
  }
  loop();
}

void printTime( int x, int y )
{
  fill ( 0 );
  text ( "" + nf ( t, 0, 4 ) + " sec", x, y );
}
