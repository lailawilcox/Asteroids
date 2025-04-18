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

    // Debug collision circle
    noFill();
    circle(location.x, location.y, diameter);

    angle += rotationSpeed;
  }

  void act() {
    location.add(velocity);
    wrapAround();
    checkForCollisions();
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      
      // Check collision with bullets
      if (obj instanceof Bullet) {
        Bullet bullet = (Bullet)obj;
        if (circleRect(location.x, location.y, diameter/2, obj.location.x, obj.location.y, obj.diameter*3, obj.diameter)) {
          lives = 0;
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
