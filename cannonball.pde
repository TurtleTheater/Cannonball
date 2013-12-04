boolean game_running = false;

color[] player_color = {
  color ( 255, 0, 0 ),
  color ( 0, 0, 255 ),
  color ( 20, 110, 12 ),
  color ( 166, 35, 173 ) };

Ball b;
Cannon c;
Target tar;
PImage bg;
int attempts = 5;
String status;
ArrayList<Player> player;
Player curPlayer;
HUD hud;
int playerNum = 1;

void setup()
{
  size ( 1000, 600 );
  bg = loadImage( "Kirby background.png" );
  frameRate ( 100 );
  c = new Cannon( 50, height-1, 45 );
  player = new ArrayList<Player>();
  hud = new HUD();
}

void draw()
{
  background ( bg );

  if ( !game_running )
  {
    noLoop();
    menu();
  }
  else // if ( game_running )
  {
    hud.draw();

    curPlayer.cannon.draw();

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
  }
}

void keyPressed()
{
  if ( !game_running )
  {
    if ( key == CODED && keyCode == UP )
    {
      if ( playerNum + 1 <= 4 )
      {
        ++playerNum;
        redraw();
      }
    }
    else if ( key == CODED && keyCode == DOWN )
    {
      if ( playerNum - 1 > 0 )
      {
        --playerNum;
        redraw();
      }
    } else if ( keyCode == ENTER || keyCode == RETURN )
    {
      game_running = true;
      reset ( playerNum );
      loop();
    }
  }
  else
  {
    if ( key == CODED && keyCode == UP && curPlayer.getAttempts() != 0 )
      curPlayer.cannon.aim ( 1 );
    if ( key == CODED && keyCode == DOWN && curPlayer.getAttempts() != 0 )
      curPlayer.cannon.aim ( -1 );
    if ( key == 'r' )
      return_to_menu();
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
}

void return_to_menu()
{
  playerNum = 1;
  game_running = false;
}

void menu()
{
  rectMode ( CORNER );
  textAlign ( LEFT );
  fill ( 0, 255, 0 );
  rect ( 230, 255, 500, 60 );

  fill ( 166, 35, 173 );
  textSize ( 40 );
  text ( "How many players? [   ]", 240, 300 );

  fill ( 0 );
  text ( "" + playerNum, 643, 300 );
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
  text ( "Number of Attempts: " + curPlayer.getAttempts(), t_x, t_y );
}

void status ( int t_x, int t_y )
{
  text ( "Status: " + status, t_x, t_y);
}

void reset()
{
  int i;
  for ( i = player.size() - 1; i >= 0; --i )
  {
    player.remove ( i );
  }
  player.add ( new Player ( "Player 1", color ( 255, 0, 0 ) ) );
  player.add ( new Player ( "Player 2", color ( 0, 0, 255 ) ) );
  tar = new Target();
  attempts = 5;

  playerNum = 0;
  curPlayer = player.get ( playerNum );
}

void reset ( int num_players )
{
  int i;

  if ( num_players > 4 || num_players < 1 )
  {
    println ( "You can't have that many players." );
    exit();
  }

  for ( i = player.size() - 1; i >= 0; --i )
  {
    player.remove ( i );
  }

  for ( i = 0; i < num_players; ++i )
  {
    player.add ( new Player ( "Player " + ( i + 1 ), player_color[ i ] ) );
  }

  tar = new Target();
  attempts = 5;

  b = new Ball( 10000, 10000 );

  playerNum = 0;
  curPlayer = player.get ( playerNum );
}
