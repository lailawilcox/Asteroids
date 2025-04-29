class Asteroid extends GameObject {

  float rotationSpeed, angle;

  Asteroid() {
    super(random(width), random(height), 1, 1);
    velocity.setMag(random(1, 3));
    velocity.rotate(random(TWO_PI));
    lives = 3;
    diameter = lives*45;
    rotationSpeed = random(-2, 2);
    angle = 0;

    // Don't spawn too close to player
    while (dist(location.x, location.y, width/2, height/2) < 200) {
      location = new PVector(random(width), random(height));
    }
  }

  // Constructor for smaller asteroids
  Asteroid(float x, float y, int l) {
    super(x, y, 1, 1);
    velocity.setMag(random(2, 4)); // Smaller asteroids move faster
    velocity.rotate(random(TWO_PI));
    lives = l;
    diameter = lives*45;
    rotationSpeed = random(-3, 3); // Smaller asteroids rotate faster
    angle = 0;
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(angle));
    scale(0.1 * lives); // Scale based on size
    image(Asteroid, 0, 0);
    popMatrix();
    angle += rotationSpeed;

    //Debug collision circle
    //noFill();
    //circle(location.x, location.y, diameter);
  }

  void act() {
    location.add(velocity);
    wrapAround(100);
    checkForCollisions();
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      // Check collision with bullets
      if (obj instanceof Bullet) {

        if (circleRect(location.x, location.y, diameter/2, obj.location.x, obj.location.y, obj.diameter*3, obj.diameter)) {
          // Split asteroid if it's not the smallest size
          if (lives > 1) {
            objects.add(new Asteroid(location.x, location.y, lives-1));
            objects.add(new Asteroid(location.x, location.y, lives-1));
          }
          // Add points based on asteroid size
          score += (4 - lives) * 100;

          // Remove asteroid and bullet
          lives = 0;
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
