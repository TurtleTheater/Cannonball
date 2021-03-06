public class Target
{
  private float pos = 0;
  private float r = 30;
  private float f_height = 75;

  public Target()
  {
    rand_pos();
  }

  public Target ( float myPos )
  {
    pos = myPos;
  }
  
  public Target ( float myPos, float myR )
  {
    pos = myPos;
    r = myR;
  }

  public void draw()
  {
    fill ( 255, 0, 0 );
    stroke ( 0 );

    pushMatrix();
    translate ( pos, height - 1 );

    rectMode ( RADIUS );
    rect ( 0, 0, r, 5 );
    line ( 0, -5, 0, -f_height );
    line ( 1, -5, 1, -f_height );
    line ( -1, -5, -1, -f_height );
    translate ( 0, -f_height );
    triangle ( 0, 0, -20, -10, 0, -20 );

    popMatrix();
  }

  public boolean within ( int p )
  {
    if ( p > leftEdge() && p < rightEdge() )
    {
      return true;
    }
    return false;
  }

  public void rand_pos()
  {
    int start = c.getWidth() + ( int ) r + 10;
    int end = width - ( int ) r;
    pos = random ( start, end );
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
