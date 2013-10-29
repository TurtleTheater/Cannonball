public class Cannon
{
  private float x;
  private float y;
  private float angle;

  public Cannon()
  {
    // I don't think we need anything here...
  }

  public Cannon(float myX, float myY)
  {
    x = myX;
    y = myY;
  }

  public Cannon(float myX, float myY, float myAngle)
  {
    x = myX;
    y = myY;
    angle = myAngle;
  }

  public Ball fire()
  {
    // Make a ball object with the right angle and velocity.
    // Return the ball object.
    // We may want to store an array of ball objects in the class, too.
    Ball b = new Ball();
    return b;
  }

  public void draw()
  {
    // Draw the cannon.
  }

  public void rotate(float myAngle)
  {
    angle += myAngle;
  }

  public float getX()
  {return x;}
  public float getY()
  {return y;}
  public float getAngle()
  {return angle;}
}
