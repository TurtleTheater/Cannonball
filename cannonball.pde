Ball b;
Cannon c;
Target tar;
PImage bg;
ArrayList<Ball> ammo;
int attempts=5;
String status;
Player p1;

void setup()
{
  size ( 1000, 600 );
  bg = loadImage( "Kirby background.png" );
  frameRate ( 100 );
  c = new Cannon( 50, height-1, 45 );
  b = new Ball( 10000, 10000 );
  tar = new Target();
  ammo= new ArrayList<Ball>();
  p1 = new Player ( "Player 1" );
}

void draw()
{
  background ( bg );

  p1.cannon.draw();
  p1.cannon.printInfo ( 170, 50 );

  for ( int i = 0; i < p1.ammo.size(); i++ )
  {
    p1.ammo.get(i).update();
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

    if ( attempts == 0 )
    {
      game_over ( 290, 300 );
    }
    noLoop();
  }
  tar.draw();
  score ( 170, 20 );
  p1.printScore ( 170, 35 );
}

void keyPressed()
{
  if ( key == CODED && keyCode == UP && attempts != 0 )
    p1.cannon.aim ( 1 );
  if ( key == CODED && keyCode == DOWN && attempts != 0 )
    p1.cannon.aim ( -1 );
  if ( key == 'r' )
    reset();
  if ( key == ' ' && attempts != 0)
  {
    b = p1.cannon.fire ();
    p1.ammo.add ( b );
    attempts--;
    status = "running";
  }
  loop();
}

void game_over ( int t_x, int t_y )
{
  textSize ( 72 );
  fill ( 0 );
  text ( "GAME OVER!", t_x, t_y );
  text ( "You scored " + p1.score() + " points.", t_x - 150, t_y + 65 );
}

void score ( int t_x, int t_y )
{
  textSize ( 12 );
  fill ( 0 );
  text ( "Number of Attempts: " + attempts, t_x, t_y );
}

void status ( int t_x, int t_y )
{
  textSize ( 12 );
  fill ( 0 );
  text ( "Status: " + status, t_x, t_y);
}

void reset()
{
  p1.cannon = new Cannon ( 50, height-1, 45 );
  p1.ammo= new ArrayList<Ball>();
  tar = new Target();
  attempts = 5;
}
