class Spaceship extends GameObject {

  //Instance Variables
  int cooldown;
  int invincibilityTimer;

  //Constructor
  Spaceship() {
    super(width/2, height/2, 0, 0, 0.1, 0);
    direction = new PVector(0.1, 0);
    cooldown = 0;
    invincibilityTimer = 0;
    diameter = 50;
    lives = 3;
  }

  //Behaviour Functions
  void show() {
    noTint();
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());

    //Blink if Invincible
    if (invincibilityTimer > 0) {
      if (frameCount % 5 == 0) {
        drawShip();
      }
    } else {
      drawShip();
    }
    popMatrix();
  }

  void act() {
    move();
    shoot();
    checkForCollisions();
    wrapAround(50);
    invincibility();
  }

  //------------------------------------------------------------------------------------------------------------------------

  void drawShip() {
    pushMatrix();
    scale(0.3);
    // Change Ship Appearance when Invincible
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
  }

  void move() {
    location.add(velocity);

    //Apply Friction to Slow Down
    velocity.mult(0.99);

    if (upkey) {
      velocity.add(direction);
      //Limit maximum speed
      if (velocity.mag() > 5) {
        velocity.setMag(5);
      }
    }
    
    if (downkey) {
      velocity.add(direction);
      //Limit maximum reverse speed (smaller than max forward speed)
      if (velocity.mag() < -3) {
        velocity.setMag(-3);
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

      //Check for Collision Between Spaceship and Asteroids
      if (obj instanceof Asteroid) {
        if (circleRect(obj.location.x, obj.location.y, obj.diameter/2, location.x, location.y, 40, 25) && invincibilityTimer <= 0) {
          loseLife();
        }
      }

      //Check for Collisions Between Spaceship and UFO
      if (obj instanceof UFO) {
        if (invincibilityTimer <= 0 && circleRect(obj.location.x, obj.location.y, obj.diameter/2, location.x, location.y, 40, 25)) {
          loseLife();
          obj.lives = 0;
        }
      }

      //Check for Collisions Between Spaceship and UFO bullets
      if (obj instanceof Bullet) {
        Bullet bullet = (Bullet)obj;
        if (bullet.isFromUFO && invincibilityTimer <= 0 && rectRect(obj.location.x, obj.location.y, 30, 25, location.x, location.y, 40, 25)) {
          score += 500;
          loseLife();
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
