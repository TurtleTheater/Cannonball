Ball b;
Cannon c;
Target tar;
PImage bg;
ArrayList<Ball> ammo;
int counter=5;
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

  if (counter == 0)
  {
    game_over ( 100, 300 );
  }

  for(int i=0;i<p1.ammo.size();i++)
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
    noLoop();
  }
  tar.draw();
  score ( 170, 20 );
  status ( 170, 35 );
}

void keyPressed()
{
  if ( key == CODED && keyCode == UP && counter != 0)
    p1.cannon.aim ( 1 );
  if ( key == CODED && keyCode == DOWN && counter != 0)
    p1.cannon.aim ( -1 );
  if ( key == ' ' && counter != 0)
  {
    b = p1.cannon.fire ();
    p1.ammo.add(b);
    counter--;
    status = "running";
  }
  loop();
}

void game_over ( int t_x, int t_y )
{
  textSize (72);
  fill ( 0 );
  text ( "GAME OVER! You lose.", t_x, t_y );
}

void score ( int t_x, int t_y )
{
  textSize ( 12 );
  fill ( 0 );
  text ( "Number of Attempts: " + counter, t_x, t_y );
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
