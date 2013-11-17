public class Player
{
  private String name;
  private Cannon cannon;
  ArrayList<Ball> ammo;

  public Player()
  {
    // Do nothing
  }
  public Player(String myName)
  {
    name = myName;
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
  
  
  public String getName()
  {return name;}
  public Cannon getCannon()
  {return cannon;}
  public ArrayList<Ball> getAmmo()
  {return ammo;}
}
