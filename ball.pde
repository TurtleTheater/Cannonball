public class Ball
{
  private float x; // The x location of the projectile
  private float y; // The y location of the projectile.
  private float velX; // The x velocity of the projectile.
  private float velY;  // The y velocity of the projectile.
  private float grav = 0.1; // Gravity
  private int r = 40; // Radius
  PImage img = loadImage("NicholasCage.png");

  Ball()
  {
    x = r / 2;
    y = r / 2;
    velX = 0;
    velY = 0;
  }

  Ball(float myX, float myY)
  {
    x = myX;
    y = myY;
    velX = 0;
    velY = 0;
  }

  Ball(float myX, float myY, float gravity)
  {
    x = myX;
    y = myY;
    velX = 0;
    velY = 0;
    grav = gravity;
  }

  Ball(float myX, float myY, float angle, float v)
  {
    x = myX;
    y = myY;
    
    velX = v * cos ( radians ( angle ) );
    velY = v * sin ( radians ( angle ) );
  }

  private void draw()
  {
    imageMode(CENTER);
    ellipse(x,y,r,r);
    image(img, x, y, r, r);
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

  void update()
  {
    physX();
    physY();
    draw();
  }

  void printInfo(int t_x, int t_y )
  {
    textSize ( 12 );
    fill ( 0 );
    text ( "" + b.x + ", " + b.y, t_x, t_y );
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
}
