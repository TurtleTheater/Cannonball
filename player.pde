public class Player
{
  private String name;
  private int score;
  private Cannon cannon;
  private Ball[] ball_array;

  public Player()
  {
    // Do nothing
  }
  public Player(String myName)
  {
    name = myName;
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
