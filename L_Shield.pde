// Shield class
class Shield extends GameObject {

  //Instance Variables
  int invincibilityTimer;

  //Constructor
  Shield() {
    super(); // Use the default empty constructor
    location = new PVector(0, 0);
    lives = 3;
    diameter = 100;
    invincibilityTimer = 0;
  }

  //Behaviour Functions
  void show() {
    stroke(blue);
    strokeWeight(3);
    if (lives == 3) {
      fill(blue, 150);
    } else if (lives == 2) {
      fill(blue, 100);
    } else {
      fill(blue, 50);
    }
    circle(location.x, location.y, diameter);
  }

  void act() {
    // Follow the player
    location = player1.location.copy();
    
    if (invincibilityTimer > 0) {
      invincibilityTimer--;
    } else {
      checkForCollisions();
    }
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);


      // Check for Collision with Asteroids
      if (obj instanceof Asteroid) {
        Asteroid asteroid = (Asteroid)obj;
        if (dist(obj.location.x, obj.location.y, location.x, location.y) < obj.diameter/2 + diameter/2) {
          lives--;
          asteroid.velocity.mult(-1);
          invincibilityTimer = 30;

          // Create Particles for Shield Collision
          for (int p = 0; p < 20; p++) {
            objects.add(new Particle(obj.location.x, obj.location.y, "blue"));
          }
        }
      }

      // Check for Collisions with UFO
      else if (obj instanceof UFO) {
        if (dist(obj.location.x, obj.location.y, location.x, location.y) < obj.diameter/2 + diameter/2) {
          lives--;
          obj.lives = 0;
          points += 500;

          // Create Particles for Shield Collision
          for (int p = 0; p < 20; p++) {
            objects.add(new Particle(obj.location.x, obj.location.y, "blue"));
          }
        }
      }

      // Check for Collisions with UFO bullets
      else if (obj instanceof Bullet) {
        Bullet bullet = (Bullet)obj;
        if (bullet.isFromUFO && dist(obj.location.x, obj.location.y, location.x, location.y) < diameter/2) {
          lives--;
          obj.lives = 0;

          // Create Particles for Shield Collision
          for (int p = 0; p < 10; p++) {
            objects.add(new Particle(obj.location.x, obj.location.y, "blue"));
          }
        }
      }
      i++;
    }

    if (lives <= 0) {
      lives = 0;
    }
  }
}
