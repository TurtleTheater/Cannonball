public class HUD
{
  int x = 0;
  int y = 0;

  int textSize = 24;
  int height;
  int width = 500;

  color bg = color ( 100, 0, 0, 150 );
  color fg = color ( 255 );

  HUD()
  {
    height = ( textSize + 10 ) * player.size();
  }
  HUD ( int myX, int myY )
  {
    height = ( textSize + 10 ) * player.size();
    x = myX;
    y = myY;
  }

  void draw()
  {
    fill ( bg );
    rect ( 0, 0, width, height );
  }
}
