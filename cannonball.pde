ball b;

void setup()
{
  size ( 500, 300 );
  frameRate ( 60 );
  b = new ball ();
  noLoop();
}

void draw()
{
  b.bDraw();
}


