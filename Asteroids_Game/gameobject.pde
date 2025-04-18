class GameObject {

  PVector location;
  PVector velocity;
  PVector direction;
  int lives;
  float diameter;
  
  GameObject(float lx, float ly, float vx, float vy) {
    location = new PVector(lx, ly);
    velocity = new PVector(vx, vy);
    lives = 1;
  }

  GameObject(float lx, float ly, float vx, float vy, float dx, float dy) {
    location = new PVector(lx, ly);
    velocity = new PVector(vx, vy);
    direction = new PVector(dx, dy);
    lives = 1;
  }

  GameObject(PVector l, PVector v, PVector d) {
    direction = d;
    location = l;
    velocity = v;
    lives = 1;
  }

  GameObject(PVector l, PVector v, int li) {
    location = l;
    velocity = v;
    lives = li;
  }

  void act() {
  }

  void show() {
  }

  void wrapAround() {
    if (location.x < 0) location.x = width;
    if (location.x > width) location.x = 0;
    if (location.y < 0) location.y = height;
    if (location.y > height) location.y = 0;
  }
}
