public class Cannon
{
  private float x;
  private float y;
  private int height = 100;
  private int width = 50;
  private float angle;
  private float v = 3;

  public Cannon()
  {
    // I don't think we need anything here...
  }

  public Cannon(float myX, float myY)
  {
    x = myX;
    y = myY;
    angle=45;
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
    
    float ballX, ballY;
    ballX = x + height * cos ( -1 * radians ( angle ) );
    ballY = y + width * sin ( -1 * radians ( angle ) );
    Ball b = new Ball(ballX, ballY, angle, v);
    return b;
  }

  public void draw()
  {
    rectMode(CORNER);
    pushMatrix();
    fill(0);
    translate(x,y);
    rotate(-1*radians(angle));
    rect(0,0,height,width);
    popMatrix();
  }

  //Rotate is a reserved method used to get shapes to turn. Changed to turn to aim to avoid conflict.
  public void aim(float myAngle)
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
