void initializeGame() {
  objects = new ArrayList<GameObject>();
  player1 = new Spaceship();
  objects.add(player1);
  ufo = new UFO();
  objects.add(ufo);

  // Add initial asteroids
  for (int i = 0; i < initialAsteroids; i++) {
    objects.add(new Asteroid());
  }

  score = 0;

  ufoTimer = int(random(300, 600));
}

void drawSquareButton(float x, float y, float w, float h, float c, int on, int off) {
  if (mouseX < x+w/2 && mouseX > x-w/2 && mouseY < y+h/2 && mouseY > y-h/2) {
    strokeWeight(on);
  } else {
    strokeWeight(off);
  }
  rect(x, y, w, h, c);
}

boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

  // temporary variables to set edges for testing
  float testX = cx;
  float testY = cy;

  // which edge is closest?
  if (cx < rx)         testX = rx;      // test left edge
  else if (cx > rx+rw) testX = rx+rw;   // right edge
  if (cy < ry)         testY = ry;      // top edge
  else if (cy > ry+rh) testY = ry+rh;   // bottom edge

  // get distance from closest edges
  float distX = cx-testX;
  float distY = cy-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the radius, collision!
  if (distance <= radius) {
    return true;
  }
  return false;
}
