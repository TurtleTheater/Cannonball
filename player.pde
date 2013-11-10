public class Player
{
  private String name;
  private int score;
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
  
  public String getName()
  {return name;}
  public int getScore()
  {return score;}
  public Cannon getCannon()
  {return cannon;}
  public Ball[] getBalls()
  {return ball_array;}
}
