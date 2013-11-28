Ball b;
Cannon c;
Target tar;
PImage bg;
ArrayList<Ball> ammo;
String status;
Player p;

void setup()
{
  size ( 1000, 600 );
  bg = loadImage( "Kirby background.png" );
  frameRate ( 100 );
  b = new Ball( 10000, 10000 );
  tar = new Target();
  p=new Player("Mr. Cage");
  
}

void draw()
{
  background ( bg );

  p.getCannon().draw();
  p.getCannon().printInfo ( 170, 50 );

  for(int i=0;i<p.getAmmo().size();i++)
  {
    p.getAmmo().get(i).update();
  }
  
  if ( b.getY() >= height )
  {
    if ( b.hit ( tar ) )
    {
      status = "hit";
      tar.rand_pos();
    }
    else if ( status != "hit" )
    {
      status = "miss";
    }
    noLoop();
  }
  tar.draw();
  score ( 170, 20 );
  status ( 170, 35 );
  
}

void keyPressed()
{
  if ( key == CODED && keyCode == UP )
    p.getCannon().aim ( 1 );
  if ( key == CODED && keyCode == DOWN )
    p.getCannon().aim ( -1 );
  if ( key == ' ' )
  {
   p.fire_cannon();
    status = "running";
  }
  loop();
}

void score ( int t_x, int t_y )
{
  textSize ( 12 );
  fill ( 0 );
  text ( "Number of Attempts: " + p.getAttempts(), t_x, t_y );
}

void status ( int t_x, int t_y )
{
  textSize ( 12 );
  fill ( 0 );
  text ( "Status: " + status, t_x, t_y);
}

void reset()
{
  // Reset function goes here.
}
