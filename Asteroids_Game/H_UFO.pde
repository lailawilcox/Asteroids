class UFO extends GameObject {

  //Instance Variables
  int cooldown;
  float angle;

  //Constructors
  UFO() {
    super(0, 0, 0, 0);

    diameter = 80;
    cooldown = 60;
    angle = 0;
    lives = 1;

    int side = (int)random(0, 4);

    if (side == 0) {
      // Top
      location.x = random(width);
      location.y = -diameter;
      velocity.x = 0;
      velocity.y = random(1, 3);
    } else if (side == 1) {
      // Right
      location.x = width + diameter;
      location.y = random(height);
      velocity.x = random(-3, -1);
      velocity.y = 0;
    } else if (side == 2) {
      // Bottom
      location.x = random(width);
      location.y = height + diameter;
      velocity.x = 0;
      velocity.y = random(-3, -1);
    } else if (side == 3) {
      // Left
      location.x = -diameter;
      location.y = random(height);
      velocity.x = random(1, 3);
      velocity.y = 0;
    }

    //Calculate where the UFO will Enter the Screen
    float futureX = location.x + velocity.x * (diameter/velocity.mag());
    float futureY = location.y + velocity.y * (diameter/velocity.mag());

    //Check Distance to Player at the Point where the UFO Enters the Screen
    while (dist(futureX, futureY, player1.location.x, player1.location.y) < 100) {
      //Adjust Position Based on the Side
      if (side == 0) {
        location.x = random(width);
      } else if (side == 1) {
        location.y = random(height);
      } else if (side == 2) {
        location.x = random(width);
      } else if (side == 3) {
        location.y = random(height);
      }

      //Recalculate Future Position
      futureX = location.x + velocity.x * (diameter/velocity.mag());
      futureY = location.y + velocity.y * (diameter/velocity.mag());
    }
  }

  void show() {
    noTint();
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    image(UFO, 0, 0);
    popMatrix();

    //Debug collision circle
    //noFill();
    //stroke(white);
    //circle(location.x, location.y, diameter);
  }

  void act() {
    if (!shouldFreeze()) {
      move();
      updateAngle();


      cooldown--;
      if (cooldown <= 0) {
        shoot();
        cooldown = int(random(50, 200));
      }
    } else {
      //Particles
      for (int p = 0; p < 5; p++) {
        objects.add(new Particle(location.x, location.y, "lightBlue"));
      }
    }
    checkForCollisions();
  }


  //------------------------------------------------------------------------------------------------------------------------

  void updateAngle() {
    // Find the player
    for (GameObject obj : objects) {
      if (obj instanceof Spaceship) {
        //Calculate direction to player
        float dirX = obj.location.x - location.x;
        float dirY = obj.location.y - location.y;

        angle = atan2(dirY, dirX);
      }
    }
  }

  void move() {
    location.add(velocity);

    if (location.x < -diameter*2 || location.x > width+diameter*2 || location.y < -diameter*2 || location.y > height+diameter*2) {
      lives = 0;
    }
  }

  void shoot() {
    PVector bulletDirection = new PVector(cos(angle), sin(angle));
    objects.add(new Bullet(location.copy(), bulletDirection));
  }

  //------------------------------------------------------------------------------------------------------------------------

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      //Check for Collision Between UFO and Asteroids
      if (obj instanceof Asteroid) {
        if (dist(obj.location.x, obj.location.y, location.x, location.y) <= (obj.diameter/2)+(diameter/2)+10) {
          tint(white, 5);
        }
      }

      //Check for Collisions Between UFO and Spaceship Bullets
      if (obj instanceof Bullet) {
        Bullet bullet = (Bullet)obj;
        if (!bullet.isFromUFO && dist(obj.location.x, obj.location.y, location.x, location.y) <= (obj.diameter/2)+(diameter/2)) {
          score += 500;

          lives = 0;
          obj.lives = 0;

          //Particles
          for (int p = 0; p < 50; p++) {
            objects.add(new Particle(location.x, location.y, "grey"));
          }
        }
      }
      i++;
    }
  }
}
