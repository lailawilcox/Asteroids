class GameObject {

  //Instance Variables
  PVector location;
  PVector velocity;
  PVector direction;
  int lives;
  float diameter;

  //Constructors
  //empty
  GameObject() {
    lives = 1;
  }

  //Asteroids
  GameObject(float lx, float ly, float vx, float vy) {
    location = new PVector(lx, ly);
    velocity = new PVector(vx, vy);
    lives = 1;
  }

  //SpaceShip
  GameObject(float lx, float ly, float vx, float vy, float dx, float dy) {
    location = new PVector(lx, ly);
    velocity = new PVector(vx, vy);
    direction = new PVector(dx, dy);
    lives = 1;
  }

  //Bullets
  GameObject(PVector l, PVector v, PVector d) {
    direction = d;
    location = l;
    velocity = v;
    lives = 1;
  }

  void act() {
  }

  void show() {
  }

  void wrapAround(float add) {
    if (location.x < 0-add) location.x = width+add;
    if (location.x > width+add) location.x = 0-add;
    if (location.y < 0-add) location.y = height+add;
    if (location.y > height+add) location.y = 0-add;
  }
}
