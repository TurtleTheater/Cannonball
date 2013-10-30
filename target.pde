public class Target
{
  private float pos = 0;
  private float r = 30;

  public Target()
  {
    // Do nothing.
  }

  public Target(float myPos)
  {
    pos = myPos;
  }
  
  public Target(float myPos, float myR)
  {
    pos = myPos;
    r = myR;
  }

  public draw()
  {
    // Do nothing.
  }

  public float getPos()
  {return pos;}
  public float getR()
  {return r;}
}
