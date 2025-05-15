class Bullet extends GameObject {

  //Instance Variables
  boolean isFromUFO;

  //Constructors
  //Spaceship Bullets
  Bullet() {
    super(player1.location.copy(), player1.direction.copy(), player1.direction.copy());
    velocity.setMag(10);
    isFromUFO = false;
  }

  //UFO Bullets
  Bullet(PVector l, PVector d) {
    super(l, d, d);
    velocity.setMag(4);
    isFromUFO = true;
  }

  //Behaviour Functions
  void show() {
    noTint();
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    if (!isFromUFO) {
      image(SpaceShipBullet, 0, 0);

      //Debug collision box
      //noFill();
      //rect(0, 0, 30, 10);
    } else {
      image(UFOBullet, 0, 0);

      //Debug collision box
      //noFill();
      //rect(0, 0, 30, 25);
    }
    popMatrix();
  }

  void act() {
    if (!shouldFreeze()) {
      location.add(velocity);
    } else {
      //Particles
      for (int p = 0; p < 5; p++) {
        objects.add(new Particle(location.x, location.y, "lightBlue"));
      }
    }

    checkForCollisions();

    //Delet Bullet when it Goes Off the Screen
    if (location.x < 0 || location.x > width || location.y < 0 || location.y > height) {
      lives = 0;
    }
  }

  //------------------------------------------------------------------------------------------------------------------------

  void checkForCollisions() {
    //Loop Through Objects and Find Player Bullets
    int i = 0;
    while (i < objects.size()) {
      GameObject obj1 = objects.get(i);
      if (obj1 instanceof Bullet && !((Bullet)obj1).isFromUFO) {
        Bullet playerBullet = (Bullet)obj1;

        //Loop Through Objects and Find UFO Bullets
        int j = 0;
        while (j < objects.size()) {
          GameObject obj2 = objects.get(j);
          if (obj2 instanceof Bullet && ((Bullet)obj2).isFromUFO) {
            Bullet ufoBullet = (Bullet)obj2;

            //Check for Collision Between Player Bullet and UFO Bullet
            if (rectRect(playerBullet.location.x, playerBullet.location.y, 30, 10, ufoBullet.location.x, ufoBullet.location.y, 30, 25)) {
              //Destroy Both Bullets
              playerBullet.lives = 0;
              ufoBullet.lives = 0;

              //Particles
              for (int p = 0; p < 25; p++) {
                objects.add(new Particle(location.x, location.y, "greyGreen"));
              }
            }
          }
          j++;
        }
      }
      i++;
    }
  }
}
