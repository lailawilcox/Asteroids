class Spaceship extends GameObject {

  //instance variables
  int cooldown;
  int invincibilityTimer;

  //constructor
  Spaceship() {
    super(width/2, height/2, 0, 0, 0.1, 0);
    direction = new PVector(0.1, 0);
    cooldown = 0;
    invincibilityTimer = 0;
    diameter = 50; // For collision detection
    lives = 10; // Player starts with 3 lives
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

    // Apply friction to slow down
    velocity.mult(0.98);

    if (upkey) {
      velocity.add(direction);
      // Limit maximum speed
      if (velocity.mag() > 5) {
        velocity.setMag(5);
      }
    }

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
