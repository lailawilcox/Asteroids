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
    diameter = 50;
    lives = 3;
  }

  //behaviour functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());

    // Blink if invincible
    if (invincibilityTimer > 0) {
      if (frameCount % 5 == 0) {
        drawShip();
      }
    } else {
      drawShip();
    }
    popMatrix();
  }

  void drawShip() {
    pushMatrix();
    scale(0.3);
    // Change ship appearance when invincible
    if (invincibilityTimer > 0) {
      tint(white, 200);
    } else {
      noTint();
    }
    image(SpaceShip, 0, 0);
    popMatrix();

    //Debug collision box
    noFill();
    rect(0, 0, 80, 50);
    noTint();
  }

  void act() {
    move();
    shoot();
    checkForCollisions();
    wrapAround(50);
    invincibility();
  }

  void move() {
    location.add(velocity);

    // Apply friction to slow down
    velocity.mult(0.99);

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
    if (spacekey && cooldown <= 0 && invincibilityTimer <= 0) {
      objects.add(new Bullet());
      cooldown = 30;
    }
  }

  void invincibility() {
    if (invincibilityTimer > 0) {
      invincibilityTimer--;
    }
  }

  void loseLife() {
    lives--;
    invincibilityTimer = 200;
  }


  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      // Check collision with asteroid
      if (obj instanceof Asteroid) {
        if (circleRect(obj.location.x, obj.location.y, obj.diameter/2, location.x, location.y, 40, 25) && invincibilityTimer <= 0) {
          loseLife();
        }
      }
      i++;
    }
  }
}
