class Bullet extends GameObject {

  int timer;

  //constructor
  Bullet() {
    super(player1.location.copy(), player1.direction.copy(), player1.direction.copy());
    velocity.setMag(10);
    timer = 60;
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

    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    noFill();
    rect(0, 0, diameter*3, diameter);
    popMatrix();
  }

  void act() {
    location.add(velocity);
    timer--;
    if (timer == 0) lives = 0;
  }
}
