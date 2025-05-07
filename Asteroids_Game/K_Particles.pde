class Particle extends GameObject {

  //Instance Variables
  float transparency;
  float size;
  color particleColour;
  float r, g, b;

  //Constructor

  //Thruster particle
  Particle(float x, float y) {
    super(x, y, 0, 0);

    PVector thrustDir = player1.direction.copy().mult(-1);
    thrustDir.rotate(random(-0.5, 0.5));
    velocity = thrustDir.mult(random(1, 3));
    transparency = 255;
    diameter = random(2, 10);
    particleColour = color(255, random(0, 255), 0, transparency);

    //red, orange, yellow colours
    r = 250;
    g = random(0, 255);
    b = 0;
  }

  //Explosion particle
  Particle(float x, float y, String c) {

    /*
    collisions between:
     spaceship and ufo - grey
     ufo and spaceship bullet - grey
     
     spaceship and asteroids - greyOrange
     asteroid and spaceship bullet - greyOrange
     
     spaceship and ufo bullet - greyGreen
     ufo bullet and spaceship bullet - greyGreen
     
     asteroid and ufo bullet - greenOrange
     
     shield - blue
     teleport - purple
     freeze - lightBlue
     */

    super(x, y, 1, 1);
    // Explosion particle
    velocity.rotate(random(TWO_PI));
    velocity.setMag(random(0.5, 3));
    transparency = 255;
    diameter = random(2, 10);

    if (c.equals("grey")) {
      float tempColour = random(90, 255);
      r = tempColour;
      g = tempColour;
      b = tempColour;
    } else if (c.equals("greyOrange")) {
      float tempColour = random(90, 255);
      if (tempColour >= 172.5) {
        //orange
        r = 255;
        g = random(115, 170);
        b = 0;
      } else {
        //grey
        r = tempColour;
        g = tempColour;
        b = tempColour;
      }
    } else if (c.equals("greyGreen")) {
      float tempColour = random(90, 255);
      if (tempColour >= 172.5) {
        //green
        r = random(0, 115);
        g = 180;
      } else {
        //grey
        r = tempColour;
        g = tempColour;
        b = tempColour;
      }
      b = 0;
    } else if (c.equals("greenOrange")) {
      float tempColour = random(0, 100);
      if (tempColour >= 50) {
        //orange
        r = 255;
        g = random(115, 170);
      } else {
        //green
        r = random(0, 115);
        g = 180;
      }
      b = 0;
    } else if (c.equals("purple")) {
      r = random(145, 195);
      g = 0;
      b = 200;
    } else if (c.equals("blue")) {
      r = 0;
      g = random(70, 170);
      b = 200;
    } else if (c.equals("lightBlue")) {
      r = 160;
      g = random(215, 250);
      b = 250;
    }
  }

  //Behaviour Functions
  void show() {
    noStroke();
    fill(particleColour);
    circle(location.x, location.y, diameter);
  }

  void act() {
    location.add(velocity);

    // Fade out over time
    transparency -= 5;
    if (transparency <= 0) {
      lives = 0;
    }

    // Update color with new transparency
    particleColour = color(r, g, b, transparency);
  }
}

//------------------------------------------------------------------------------------------------------------------------
