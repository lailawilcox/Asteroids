class UFO extends GameObject {
  int cooldown;

  UFO() {
    super(0, 0, 0, 0);

    diameter = 80;
    lives = 1;
    cooldown = 60;

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
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y);
    image(UFO, 0, 0);
    popMatrix();

    // Debug collision circle
    noFill();
    stroke(white);
    circle(location.x, location.y, diameter);
  }

  void act() {
    move();
    shoot();
    checkForCollisions();




    cooldown--;
    if (cooldown <= 0) {
      shoot();
      cooldown = int(random(60, 120));
    }
  }

  void move() {
    location.add(velocity);

    if (location.x < -diameter*2 || location.x > width+diameter*2 || location.y < -diameter*2 || location.y > height+diameter*2) {
      lives = 0;
    }
  }



  void shoot() {
    for (GameObject obj : objects) {
      if (obj instanceof Spaceship) {
        // Calculate direction to player
        PVector bulletDir = new PVector(obj.location.x - location.x, obj.location.y - location.y);
        bulletDir.normalize();

        // Create and store target direction to be used later
        direction = bulletDir.copy();
      }
    }
  }


  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      // Check collision with asteroid
      if (obj instanceof Asteroid) {
        if (dist(obj.location.x, obj.location.y, location.x, location.y) <= (obj.diameter/2)+(diameter/2) ) {
          lives = 0;
        }
      }
      i++;
    }
  }
}
