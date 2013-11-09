Ball b;
Cannon c;
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

  c.draw();
  c.printInfo ( 170, 50 );
  for(int i=0;i<ammo.size();i++)
  {
    ammo.get(i).update();
  }
  
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
  }
  loop();
}
