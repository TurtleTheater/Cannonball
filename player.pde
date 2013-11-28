public class Player
{
  private String name;
 // private int points;
  private Cannon cannon;
  private ArrayList<Ball> ammo;
  private int atmps;
  

  public Player()
  {
    // Do nothing
  }
  public Player(String myName)
  {
    name = myName;
    ammo= new ArrayList<Ball>();
    cannon= new Cannon( 50, height-1, 45 );
    atmps=5;
  }

  public void fire_cannon()
  {
    ammo.add ( cannon.fire() );
  }
  
  public int score()
  {
    int points=0;
    for(int i=0; i<ammo.size();i++)
    {
      if(ammo.get(i).hasHit())
      {
        points+=10;
      }
      
    }
    return points;
    
    
  }
  
  public int getAttempts()
  {
    return atmps-ammo.size();
  }
  
  
  public String getName()
  {return name;}
  public Cannon getCannon()
  {return cannon;}
  public ArrayList<Ball> getAmmo()
  {return ammo;}
}
