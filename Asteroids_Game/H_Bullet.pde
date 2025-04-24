class Bullet extends GameObject {


  //constructor
  Bullet() {
    super(player1.location.copy(), player1.direction.copy(), player1.direction.copy());
    velocity.setMag(10);
    diameter = 10;
  }

  //behaviour functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    scale(0.05);
    image(Bullet, 0, 0);
    popMatrix();

    //Debug collision box
    //pushMatrix();
    //translate(location.x, location.y);
    //rotate(direction.heading());
    //noFill();
    //rect(0, 0, diameter*3, diameter);
    //popMatrix();
  }

  void act() {
    location.add(velocity);
    if (location.x < 0 || location.x > width || location.y < 0 || location.y > height) {
      lives = 0;
    }
  }
}
