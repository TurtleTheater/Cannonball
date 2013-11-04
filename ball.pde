public class Ball
{
  private float x; // The x location of the projectile
  private float y; // The y location of the projectile.
  private float rotation = 0; // The rotation in degrees of the projectile.
  private float velX = 0; // The x velocity of the projectile.
  private float velY = 0;  // The y velocity of the projectile.
  private float velR = 1; // The speed that the projectile will spin.
  private float grav = 0.05; // Gravity
  private int r = 40; // Radius
  PImage img = loadImage("NicholasCage.png");

  Ball()
  {
    x = r / 2;
    y = r / 2;
  }

  Ball(float myX, float myY)
  {
    x = myX;
    y = myY;
  }

  Ball(float myX, float myY, float gravity)
  {
    x = myX;
    y = myY;
    grav = gravity;
  }

  Ball(float myX, float myY, float angle, float v)
  {
    x = myX;
    y = myY;
    
    velX = v * cos ( radians ( angle ) );
    velY = -1 * v * sin ( radians ( angle ) );
  }

  Ball(Ball myBall)
  {
    x = myBall.x;
    y = myBall.y;
    rotation = myBall.rotation;
    velX = myBall.velX;
    velY = myBall.velY;
    velR = myBall.velR;
    grav = myBall.grav;
    r = myBall.r;
  }

  private void draw()
  {
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    imageMode(CENTER);
    fill(0);
    ellipse(0,0,r,r);
    image(img, 0, 0, r, r);
    popMatrix();
  }


  private void physX()
  {
    x+=velX;
  }

  private void physY()
  {
    y+=velY;
    velY+=grav;
  }
  
  private void turn()
  {
    rotation += velR;
  }

  void update()
  {
    if ( y < height )
    {
      physX();
      physY();
      turn();
    } else
    {
      y = height;
    }
    draw();
  }

  void printInfo(int t_x, int t_y )
  {
    textSize ( 12 );
    fill ( 0 );
    text ( "(" + nf ( x, 3, 4 ) + ", " + nf ( y, 3, 4 ) + ")", t_x, t_y );
  }


  protected void setX(float myX)
  {x = myX;}
  protected void setY(float myY)
  {y = myY;}
  protected void setVelX(float vX)
  {velX = vX;}
  protected void setVelY(float vY)
  {velY = vY;}
  protected void setGravity(float g)
  {grav = g;}
  public float getX()
  {return x;}
  public float getY()
  {return y;}
  public float getGravity()
  {return grav;}
  public float getVelX()
  {return velX;}
  public float getVelY()
  {return velY;}    
  public float getR()
  {return r;}
}
