Ball b;
Cannon c;
Target tar;
PImage bg;
ArrayList<Ball> ammo;
int attempts = 5;
String status;
ArrayList<Player> player;
Player curPlayer;
int playerNum = 0;

void setup()
{
  size ( 1000, 600 );
  bg = loadImage( "Kirby background.png" );
  frameRate ( 100 );
  c = new Cannon( 50, height-1, 45 );
  b = new Ball( 10000, 10000 );
  tar = new Target();
  ammo= new ArrayList<Ball>();
  player = new ArrayList<Player>();
  player.add ( new Player ( "Player 1" ) );
  player.add ( new Player ( "Player 2" ) );
  curPlayer = player.get ( playerNum );
}

void draw()
{
  background ( bg );

  curPlayer.cannon.draw();
  curPlayer.cannon.printInfo ( 170, 50 );

  for ( Player p : player )
  {
    for ( int i = 0; i < p.ammo.size(); i++ )
    {
      p.ammo.get(i).update();
    }
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

    if ( curPlayer.getAttempts() == 0 )
    {
      game_over ( 290, 300 );
    }
    noLoop();
  }
  tar.draw();
  score ( 170, 20 );
  curPlayer.printScore ( 170, 35 );
}

void keyPressed()
{
  if ( key == CODED && keyCode == UP && curPlayer.getAttempts() != 0 )
    curPlayer.cannon.aim ( 1 );
  if ( key == CODED && keyCode == DOWN && curPlayer.getAttempts() != 0 )
    curPlayer.cannon.aim ( -1 );
  if ( key == 'r' )
    reset();
  if ( key == ' ' && curPlayer.getAttempts() != 0 && b.getY() >= height)
  {
    b = curPlayer.cannon.fire ();
    curPlayer.ammo.add ( b );
    
    status = "running";

    playerNum += 1;
    playerNum %= player.size();
    curPlayer = player.get ( playerNum );
  }
  loop();
}

void game_over ( int t_x, int t_y )
{
  Player winner = winner();
  textSize ( 72 );
  fill ( 0 );
  text ( winner.getName() + " wins!", t_x, t_y );
  text ( "You scored " + winner.score() + " points.", t_x - 150, t_y + 65 );
}

Player winner()
{
  Player winner = player.get ( 0 );
  for ( Player p : player )
  {
    if ( p.score() > winner.score() )
    {
      winner = p;
    }
  }
  return winner;
}

void score ( int t_x, int t_y )
{
  textSize ( 12 );
  fill ( 0 );
  text ( "Number of Attempts: " + curPlayer.getAttempts(), t_x, t_y );
}

void status ( int t_x, int t_y )
{
  textSize ( 12 );
  fill ( 0 );
  text ( "Status: " + status, t_x, t_y);
}

void reset()
{
  curPlayer.cannon = new Cannon ( 50, height-1, 45 );
  curPlayer.ammo= new ArrayList<Ball>();
  tar = new Target();
  attempts = 5;
}
