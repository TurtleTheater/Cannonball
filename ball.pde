public class Ball
{
  private float x; // The x location of the projectile
  private float y; // The y location of the projectile.
  private float velX; // The x velocity of the projectile.
  private float velY;  // The y velocity of the projectile.
  private float grav; // Gravity
  private int r; // Radius 
  
  Ball()
  {
    x = 10;
    y = 10;
    r = 20;
    velX = 0;
    velY = 0;
    grav = 9.8;
  }
  
  Ball(float myX, float myY)
  {
    x = myX;
    y = myY;
    r = 20;
    grav = 9.8;
  }
  
 Ball(float myX, float myY, float gravity)
  {
     x = myX;
     y = myY;
     r = 20;
     grav = gravity;
  }
  
  private void draw()
  {
    ellipse(x,y,r,r);
  }
  
  
  private void physX()
  {
    // Do nothing
  }
  
  private void physY()
  {
    // Do nothing
  }

  void update()
  {
    physX();
    physY();
    draw();
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
