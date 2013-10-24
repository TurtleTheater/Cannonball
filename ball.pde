public class ball
{
  private float x; // The x location of the projectile
  private float y; // The y location of the projectile.
  private float velX; // The x velocity of the projectile.
  private float velY;  // The y velocity of the projectile.
  private float grav; // Gravity
  private int r; // Radius 
  
  ball()
  {
    x = 10;
    y = 10;
    r = 10;
    velX = 0;
    velY = 0;
    grav = 9.8;
  }
  
  ball(float myX, float myY)
  {
    x = myX;
    y = myY;
    grav = 9.8;
  }
  
 ball(float myX, float myY, float gravity)
  {
     x = myX;
     y = myY;
     grav = gravity;
  }
  
  void bDraw()
  {
    ellipse(x,y,r,r);
  }
  
  
  float physX()
  {
    return -1;
  }
  
  float physY()
  {
    return -1;
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
