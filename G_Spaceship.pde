class Spaceship extends GameObject {

  //Instance Variables
  //Shooting Variables
  int shootingCooldown;

  //Invincibility Variable
  int invincibilityTimer;

  //PowerUp Variables
  int teleportTimer;
  int shieldTimer;
  boolean shieldActive;
  Shield activeShield;
  int freezeTimer;
  int freezeTime;

  //Constructor
  Spaceship() {
    super(width/2, height/2, 0, 0, 0.1, 0);
    direction = new PVector(0.1, 0);
    shootingCooldown = 0;
    invincibilityTimer = 0;
    teleportTimer = 0;
    shieldTimer = 0;
    shieldActive = false;
    freezeTimer = 0;
    freezeTime = 0;
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

    //Power-Ups
    teleport();
    if (teleportBought) teleportBar();

    shield();
    if (shieldBought) shieldBar();

    freeze();
    if (freezeBought)freezeBar();
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
    //noFill();
    //rect(0, 0, 80, 50);
  }

  void move() {
    location.add(velocity);

    //Apply Friction to Slow Down
    velocity.mult(0.99);

    if (upkey) {
      velocity.add(direction);

      //Right Thruster
      PVector offsetxr = direction.copy();
      PVector offsetyr = direction.copy();
      offsetxr.rotate(PI);
      offsetxr.setMag(40);
      offsetyr.rotate(PI/2);
      offsetyr.setMag(18);
      objects.add(new Particle(location.x + offsetxr.x + offsetyr.x, location.y + offsetxr.y  + offsetyr.y));

      //Left Thruster
      PVector offsetxl = direction.copy();
      PVector offsetyl = direction.copy();
      offsetxl.rotate(PI);
      offsetxl.setMag(40);
      offsetyl.rotate(PI/2);
      offsetyl.setMag(-18);
      objects.add(new Particle(location.x + offsetxl.x + offsetyl.x, location.y + offsetxl.y + offsetyl.y));


      //Limit maximum speed
      if (velocity.mag() > 5) {
        velocity.setMag(5);
      }
    }

    if (downkey) {
      velocity.sub(direction);

      //Center Thruster
      PVector offset = direction.copy();
      offset.rotate(PI);
      offset.setMag(40);
      objects.add(new Particle(location.x + offset.x, location.y + offset.y));

      //Limit maximum reverse speed (smaller than max forward speed)
      if (velocity.mag() < -3) {
        velocity.setMag(-3);
      }
    }

    if (leftkey) direction.rotate(-radians(3));
    if (rightkey) direction.rotate(radians(3));
  }

  void shoot() {
    shootingCooldown--;
    if (spacekey && shootingCooldown <= 0) {
      objects.add(new Bullet());
      shootingCooldown = 30;
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

  //------------------------------------------------------------------------------------------------------------------------

  void teleport() {
    if (twoKey && teleportTimer <= 0) {

      // Create Particles for Teleport at Old Location
      for (int i = 0; i < 25; i++) {
        objects.add(new Particle(location.x, location.y, "purple"));
      }

      boolean safePositionFound = false;
      int attempts = 0;
      int maxAttempts = 100;

      float newX = 0;
      float newY = 0;

      while (!safePositionFound && attempts < maxAttempts) {
        attempts++;

        newX = random(0, width);
        newY = random(0, height);

        safePositionFound = true;

        if (dist(location.x, location.y, newX, newY) < diameter/2 + 200) {
          safePositionFound = false;
        }

        //Check Distance Between Spaceship and Edge
        if (newX < 100 || newX > width-100 || newY < 100 || newY > height-100)safePositionFound = false;

        int i = 0;
        while (i < objects.size()) {
          GameObject obj = objects.get(i);

          if (obj instanceof Asteroid) {
            //Check Distance Between Spaceship and Asteroids
            if (circleRect(obj.location.x, obj.location.y, obj.diameter/2, newX, newY, 140, 125)) {
              safePositionFound = false;
            }
          } else if (obj instanceof UFO) {
            //Check Distance Between Spaceship and UFO
            if (circleRect(obj.location.x, obj.location.y, obj.diameter/2, newX, newY, 140, 125)) {
              safePositionFound = false;
            }
          } else if (obj instanceof Bullet && ((Bullet)obj).isFromUFO) {
            //Check Distance Between Spaceship and UFO bullets
            if (rectRect(obj.location.x, obj.location.y, 30, 25, newX, newY, 140, 125)) {
              safePositionFound = false;
            }
          }
          i++;
        }
      }

      if (safePositionFound) {
        location.x = newX;
        location.y = newY;

        // Create Particles for Teleport at New Location
        for (int i = 0; i < 50; i++) {
          objects.add(new Particle(location.x, location.y, "purple"));
        }
      }

      teleportTimer = 1000;
    }
  }


  void teleportBar() {
    if (teleportTimer >= 0) {
      teleportTimer--;

      noStroke();
      fill(purple, 200);
      rectMode(CORNER);
      rect(width/2-80, height-38, 200-(teleportTimer/5), 20);
      rectMode(CENTER);
    } else {
      noStroke();
      fill(purple);
      rectMode(CORNER);
      rect(width/2-80, height-38, 200, 20);
      rectMode(CENTER);
    }
  }

  //------------------------------------------------------------------------------------------------------------------------

  void shield() {
    if (oneKey && shieldTimer <= 0) {
      shieldActive = true;
      activeShield = new Shield();
      objects.add(activeShield);
      shieldTimer = 600;
    }

    boolean foundShield = false;
    for (GameObject obj : objects) {
      if (obj instanceof Shield) {
        foundShield = true;
      }
    }
    shieldActive = foundShield;
  }


  void shieldBar() {
    if (shieldTimer >= 0 && !shieldActive) {
      shieldTimer--;

      noStroke();
      fill(blue, 200);
      rectMode(CORNER);
      rect(width/2-380, height-38, 200-(shieldTimer/3), 20);
      rectMode(CENTER);
    } else if (!shieldActive) {
      noStroke();
      fill(blue);
      rectMode(CORNER);
      rect(width/2-380, height-38, 200, 20);
      rectMode(CENTER);
    }
  }

  //------------------------------------------------------------------------------------------------------------------------

  void freeze() {
    if (threeKey && freezeTimer <= 0) {
      freezeTime = 150;
      freezeTimer = 1400;
    }
  }


  void freezeBar() {
    if (freezeTime > 0) {
      freezeTime--;
    }
    if (freezeTimer > 0 && freezeTime <= 0) {
      // Only count down cooldown after freeze effect ends
      freezeTimer--;
    }
    if (freezeTime > 0 || freezeTimer > 0) {
      noStroke();
      fill(lblue, 200);
      rectMode(CORNER);
      rect(width/2+220, height-38, 200-(freezeTimer/7), 20);
      rectMode(CENTER);
    } else {
      noStroke();
      fill(lblue);
      rectMode(CORNER);
      rect(width/2+220, height-38, 200, 20);
      rectMode(CENTER);
    }
  }

  //------------------------------------------------------------------------------------------------------------------------

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      //Check for Collision Between Spaceship and Asteroids
      if (obj instanceof Asteroid) {
        Asteroid asteroid = (Asteroid)obj;
        if (!shieldActive && circleRect(obj.location.x, obj.location.y, obj.diameter/2, location.x, location.y, 40, 25) && invincibilityTimer <= 0) {
          loseLife();
          asteroid.velocity.mult(-1);

          //Particles
          for (int p = 0; p < 100; p++) {
            objects.add(new Particle(location.x, location.y, "greyOrange"));
          }
        }
      }

      //Check for Collisions Between Spaceship and UFO
      if (obj instanceof UFO) {
        if (invincibilityTimer <= 0 && !shieldActive && circleRect(obj.location.x, obj.location.y, obj.diameter/2, location.x, location.y, 40, 25)) {
          loseLife();
          obj.lives = 0;

          points += 500;

          //Particles
          for (int p = 0; p < 100; p++) {
            objects.add(new Particle(location.x, location.y, "grey"));
          }
        }
      }

      //Check for Collisions Between Spaceship and UFO bullets
      if (obj instanceof Bullet) {
        Bullet bullet = (Bullet)obj;
        if (bullet.isFromUFO && invincibilityTimer <= 0 && !shieldActive && rectRect(obj.location.x, obj.location.y, 30, 25, location.x, location.y, 40, 25)) {
       points += 500;
          loseLife();
          obj.lives = 0;

          //Particles
          for (int p = 0; p < 50; p++) {
            objects.add(new Particle(location.x, location.y, "greyGreen"));
          }
        }
      }
      i++;
    }
  }
}
