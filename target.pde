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

  public void draw()
  {
    fill ( 255, 0, 0 );
    stroke ( 255, 0, 0 );

    pushMatrix();
    translate ( pos, height - 1 );

    rectMode ( RADIUS );
    rect ( 0, 0, r, 5 );

    popMatrix();
  }

  public float leftEdge()
  {return pos - r;}
  public float rightEdge()
  {return pos + r;}
  public float getPos()
  {return pos;}
  public float getR()
  {return r;}
}
