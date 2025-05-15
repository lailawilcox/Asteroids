void initializeGame() {
  //Create List of Game Objects
  objects = new ArrayList<GameObject>();

  //Add Player to the Game
  player1 = new Spaceship();
  objects.add(player1);

  //Add initial asteroids
  initialAsteroids = level;
  for (int i = 0; i < initialAsteroids; i++) {
    objects.add(new Asteroid());
  }

  //Add UFOs to the Game
  ufo = new UFO();

  //Set Initial UFO Wait Time
  ufoTimer = int(random(300, 600));
}

//------------------------------------------------------------------------------------------------------------------------

//Draw a Tactile Square Button
void drawSquareButton(float x, float y, float w, float h, float c, int on, int off) {
  if (mouseX < x+w/2 && mouseX > x-w/2 && mouseY < y+h/2 && mouseY > y-h/2) {
    strokeWeight(on);
  } else {
    strokeWeight(off);
  }
  rect(x, y, w, h, c);
}

//------------------------------------------------------------------------------------------------------------------------

//Check if a Circle and Rectangle are Colliding
boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

  //Temporary variables to Set Edges for Testing
  float testX = cx;
  float testY = cy;

  //Test which Edge is Closest?
  if (cx < rx)         testX = rx;      // test left edge
  else if (cx > rx+rw) testX = rx+rw;   // right edge
  if (cy < ry)         testY = ry;      // top edge
  else if (cy > ry+rh) testY = ry+rh;   // bottom edge

  //Get Distance from Closest Edges
  float distX = cx-testX;
  float distY = cy-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  //Check for Collision
  if (distance <= radius) {
    return true;
  }
  return false;
}

//Check if a Rectangle and Rectangle are Colliding
boolean rectRect(float r1x, float r1y, float r1w, float r1h, float r2x, float r2y, float r2w, float r2h) {
  return((r1x + r1w >= r2x && r1x <= r2x + r2w && r1y + r1h >= r2y && r1y <= r2y + r2h));
}
