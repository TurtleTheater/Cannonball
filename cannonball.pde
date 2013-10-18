void setup()
{
  size ( 500, 300 );
  frameRate ( 60 );
  drawBall ( width / 2, height / 2 );
  noLoop();
}

void draw()
{

}

void drawBall( int x, int y )
{ 
  fill ( 0 );
  stroke ( 0 );
  ellipse ( x, y, 10, 10 );
}
