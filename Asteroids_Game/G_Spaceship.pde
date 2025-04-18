class Spaceship extends GameObject {

  //instance variables
  int cooldown;

  //constructor
  Spaceship() {
    super(width/2, height/2, 0, 0, 0.1, 0);
    direction = new PVector(0.1, 0);
    cooldown = 0;
  }

  //behaviour functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    drawShip();
    popMatrix();
  }

  void drawShip() {
    pushMatrix();
    scale(0.3);
    image(SpaceShip, 0, 0);
    popMatrix();
    noFill();
    rect(0, 0, 80, 50);
  }

  void act() {
    move();
    shoot();
    checkForCollisions();
    wrapAround();
  }

  void move() {
    location.add(velocity);
    if (upkey) velocity.add(direction);
    if (leftkey) direction.rotate(-radians(3));
    if (rightkey) direction.rotate(radians(3));
  }

  void shoot () {
    cooldown--;
    if (spacekey && cooldown <= 0) {
      objects.add(new Bullet());
      cooldown = 30;
    }
  }

  void checkForCollisions() {
  }
}
