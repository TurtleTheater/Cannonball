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
    height = max ( ( textSize + 10 ) * player.size() + 10, 78 );
  }
  HUD ( int myX, int myY )
  {
    height = max ( ( textSize + 10 ) * player.size() + 10, 78 );
    x = myX;
    y = myY;
  }

  void draw()
  {
    height = max ( ( textSize + 10 ) * player.size() + 10, 78 );
    int drawY = y + 5;

    bg = color ( curPlayer.c, 150 );
    fill ( bg );
    rect ( 0, 0, width, height );

    textAlign ( LEFT, TOP );
    textSize ( textSize );
    fill ( 255 );

    for ( Player p : player )
    {
      p.printScore ( x + 5, drawY );
      drawY += textSize + 10;
    }

    curPlayer.printAttempts ( 150, y + 5 );
    curPlayer.cannon.printInfo ( 150, y + 39 );
  }
}
