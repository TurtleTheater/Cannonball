public class Cannon
{
  private float x = 0;
  private float y = height - 1;
  private int length = 100;
  private int width = 50;
  private float angle = 45;
  private float v = 5;

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
    ballX = x + length * cos ( -1 * radians ( angle ) )
      + 0.5 * width * cos ( -1 * radians ( angle + 90 ) );
    ballY = y + length * sin ( -1 * radians ( angle ) )
      + 0.5 * width * sin ( -1 * radians ( angle + 90 ) );
    Ball b = new Ball(ballX, ballY, angle, v);
    return b;
  }

  public void draw()
  {
    rectMode(CORNER);
    pushMatrix();
    fill(0);
    stroke(0);
    translate(x,y);
    rotate(-1*radians(angle));
    rect(0,0,length,-1*width);
    popMatrix();
  }

  //Rotate is a reserved method used to get shapes to turn. Changed to turn to aim to avoid conflict.
  public void aim(float myAngle)
  {
    angle += myAngle;
    if ( angle > 90 )
    {
      angle = 90;
    } else if ( angle < 0 )
    {
      angle = 0;
    }
  }

  void printInfo(int t_x, int t_y )
  {
    textSize ( 12 );
    fill ( 0 );
    text ( "Cannon angle: " + nf ( angle, 2, 0 ) + " degrees", t_x, t_y );
  }

  public float getX()
  {return x;}
  public float getY()
  {return y;}
  public float getAngle()
  {return angle;}
}
