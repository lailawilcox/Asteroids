class Asteroid extends GameObject {

  //Instance Variables
  float rotationSpeed, angle;

  //Constructors
  //Initial Asteroids
  Asteroid() {
    super(random(width), random(height), 1, 1);
    velocity.setMag(random(1, 3));
    velocity.rotate(random(TWO_PI));
    lives = 3;
    diameter = lives*45;
    rotationSpeed = random(-2, 2);
    angle = 0;

    while (dist(location.x, location.y, width/2, height/2) < 200) {
      location = new PVector(random(width), random(height));
    }
  }

  //Smaller Asteroids
  Asteroid(float x, float y, int l, Bullet sourceBullet) {
    super(x, y, 1, 1);
    PVector awayDir = new PVector(x - sourceBullet.location.x, y - sourceBullet.location.y);
    velocity = awayDir.copy();
    velocity.rotate(random(-PI/3, PI/3));
    velocity.setMag(random(2, 4));
    lives = l;
    diameter = lives*45;
    rotationSpeed = random(-3, 3);
    angle = 0;
  }

  void show() {
    noTint();
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(angle));
    scale(0.1 * lives); // Scale based on size
    image(Asteroid, 0, 0);
    popMatrix();

    //Debug collision circle
    //noFill();
    //circle(location.x, location.y, diameter);
  }

  void act() {
    if (!shouldFreeze()) {
      location.add(velocity);
      wrapAround(diameter/2);
      angle += rotationSpeed;
    } else {
      //Particles
      for (int p = 0; p < 5; p++) {
        objects.add(new Particle(location.x, location.y, "lightBlue"));
      }
    }
    checkForCollisions();
  }

  //------------------------------------------------------------------------------------------------------------------------

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      //Check for Collision Between Asteroids and Bullets
      if (obj instanceof Bullet) {
        Bullet bullet = (Bullet)obj;

        if (circleRect(location.x, location.y, diameter/2, obj.location.x, obj.location.y, 30, 15)) {
          //Split asteroid if it's not the smallest size
          if (lives > 1) {
            objects.add(new Asteroid(location.x, location.y, lives-1, bullet));
            objects.add(new Asteroid(location.x, location.y, lives-1, bullet));
          }

          if (!bullet.isFromUFO) {
            score += (4 - lives) * 100;
          }

          lives = 0;
          obj.lives = 0;

          //Particles
          float p = 0.5*diameter;
          while (p > 0) {
            if (!bullet.isFromUFO) {
              objects.add(new Particle(location.x, location.y, "greyOrange"));
            } else {
              objects.add(new Particle(location.x, location.y, "greenOrange"));
            }
            p--;
          }
        }
      }
      i++;
    }
  }
}
