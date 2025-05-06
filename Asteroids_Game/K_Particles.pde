class Particle extends GameObject {
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
     spaceship and ufo - grey: c = g
     ufo and spaceship bullet - grey: c = g
     
     spaceship and asteroids - grey and orange: c = go
     asteroid and spaceship bullet - grey and orange: c = go
     
     spaceship and ufo bullet = grey and green: c = gg
     ufo bullet and spaceship bullet - grey: c = gg
     
     asteroid and ufo bullet - green and orange: c = geo
     */

    super(x, y, 0, 0);
    // Explosion particle - random direction
    velocity = PVector.random2D().mult(random(0.5, 3));
    transparency = 255;
    diameter = random(2, 10);

    if (c.equals("g")) {
      float tempColour = random(0, 255);
      r = tempColour;
      g = tempColour;
      b = tempColour;
    } else if (c.equals("go")) {
      float tempColour = random(100, 255);
      r = 255;
      g = tempColour;
      b = tempColour-80;
    } else if (c.equals("gg")) {
      float tempColour = random(0, 255);
      r = tempColour;
      g = 200;
      b = tempColour;
    } else if (c.equals("geo")) {
      r = random(0, 255);
      if (r >= 200) {
        r = 255;
        g = random(0, 255);
      } else {
        g = 255;
      }
      b = 0;
    }
  }

  //Behaviour Functions
  void show() {
    noStroke();
    fill(particleColour);
    ellipse(location.x, location.y, diameter, diameter);
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
