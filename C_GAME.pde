void game() {
  image(Background, width/2, height/2);
  gameEngine();
  pauseButton();
  livesText();
  pointsText();
  levelText();

  if (teleportBought) showTeleportBar();
  if (shieldBought) showShieldBar();
  if (freezeBought) showFreezeBar();
}

void gameClicks() {
  //Pause Button
  if (mouseX < (width-35)+30/2 && mouseX > (width-35)-30/2 && mouseY < 35+30/2 && mouseY > 35-30/2) {
    mode = 3;
  }
}

//------------------------------------------------------------------------------------------------------------------------

void gameEngine() {
  int i = 0;
  while (i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();
    if (currentObject.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }

  //Check if Player has Died
  if (player1.lives == 0) {
    mode = 4;
  }

  //Check if all Asteroids have been Destroyed
  boolean asteroidsRemaining = false;
  for (GameObject obj : objects) {
    if (obj instanceof Asteroid) {
      asteroidsRemaining = true;
    }
  }

  if (!asteroidsRemaining) {
    mode = GAMEOVER;
  }

  // Update UFO Timer
  ufoTimer--;
  if (ufoTimer <= 0 && level > 2) {
    objects.add(new UFO());
    ufoTimer = int(random(300, 600)); // Set timer for next UFO
  }
}

//------------------------------------------------------------------------------------------------------------------------

void pauseButton() {
  fill(black);
  stroke(white);
  drawSquareButton(width-35, 35, 30, 30, 2, 4, 2);
  strokeWeight(2);
  line(width-39, 41, width-39, 29);
  line(width-31, 41, width-31, 29);
}

void pointsText() {

  //Grow Box with Score
  int w = 0;
  if (points >= 100) {
    w = w +25;
  }
  if (points >= 1000) {
    w = w +25;
  }
  if (points >= 10000) {
    w = w +25;
  }

  stroke(white);
  fill(black);
  rect(width/2, 35, 120+w, 30, 2);

  fill(orange);
  textFont(Font);
  textSize(11);
  text("Points: " + points, width/2, 35);
}

void levelText() {
  stroke(white);
  fill(black);
  rect(885, 35, 100, 30, 2);
  fill(white);
  textFont(Font);
  textSize(11);
  text("Level: " + level, 885, 35);
}

void livesText() {
  stroke(white);
  fill(black);
  rect(70, 35, 100, 30, 2);
  if (player1.lives >= 3) image(Heart, 100, 35);
  //objects.add(new Particle(x, y, "red"));
  if (player1.lives >= 2) image(Heart, 70, 35);
  if (player1.lives >= 1) image(Heart, 40, 35);
}

//------------------------------------------------------------------------------------------------------------------------

void showTeleportBar() {
  fill(black, 200);
  stroke(white);
  strokeWeight(4);
  rect(width/2-100, height-30, 40, 40, 5);
  noFill();
  rect(width/2+20, height-30, 200, 20);

  image(Teleport, width/2-100, height-30);
}

void showShieldBar() {
  fill(black, 200);
  stroke(white);
  strokeWeight(4);
  rect(width/2-400, height-30, 40, 40, 5);
  noFill();
  rect(width/2-280, height-30, 200, 20);

  image(Shield, width/2-400, height-30);
}

void showFreezeBar() {
  fill(black, 200);
  stroke(white);
  strokeWeight(4);
  rect(width/2+200, height-30, 40, 40, 5);
  noFill();
  rect(width/2+320, height-30, 200, 20);

  image(SnowFlake, width/2+199, height-30);
}
