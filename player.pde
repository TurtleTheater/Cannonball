public class Player
{
  private String name;
  private Cannon cannon;
  private ArrayList<Ball> ammo;
  private int atmps;
  

  public Player()
  {
    name = "Player";
    cannon = new Cannon ( 50, height-1, 45 );
    ammo = new ArrayList<Ball>();
  }
  public Player ( String myName )
  {
    name = myName;
    atmps = 5;
    cannon = new Cannon ( 50, height-1, 45 );
    ammo = new ArrayList<Ball>();
  }

  public void fire_cannon()
  {
    ammo.add ( cannon.fire() );
  }
  
  public int score()
  {
    int points=0;
    for( int i = 0; i < ammo.size(); i++ )
    {
      if ( ammo.get(i).hasHit() )
      {
        points+=10;
      }
      
    }
    return points;
  }

  public void printScore ( int t_x, int t_y )
  {
    text ( name + ": " + score(), t_x, t_y );
  }

  void printAttempts ( int t_x, int t_y )
  {
    text ( name + ": " + getAttempts() + " attempts remain", t_x, t_y );
  }
  
  public int getAttempts()
  {return atmps-ammo.size();}
  public String getName()
  {return name;}
  public Cannon getCannon()
  {return cannon;}
  public ArrayList<Ball> getAmmo()
  {return ammo;}
}
