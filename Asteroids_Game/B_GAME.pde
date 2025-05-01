void game() {
  image(Background, width/2, height/2);
  gameEngine();
  pauseButton();
  livesText();
  scoreText();
}

void gameClicks() {
  //pause button
  if (mouseX < (width-35)+30/2 && mouseX > (width-35)-30/2 && mouseY < 35+30/2 && mouseY > 35-30/2) {
    mode = 2;
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

  if (player1.lives == 0 || objects.size() == 1) {
    mode = 3;
    if (score > highScore) {
      highScore = score;
    }
  }

  // Update UFO timer
  ufoTimer--;
  if (ufoTimer <= 0) {
    objects.add(new UFO());
    ufoTimer = int(random(300, 600)); // Set timer for next UFO
  }
}

  void pauseButton() {
    fill(black);
    stroke(white);
    drawSquareButton(width-35, 35, 30, 30, 2, 4, 2);
    strokeWeight(2);
    line(width-39, 41, width-39, 29);
    line(width-31, 41, width-31, 29);
  }

  void livesText() {
    stroke(white);
    fill(black);
    rect(70, 35, 100, 30, 2);
    fill(white);
    textFont(Font);
    textSize(20);
    text("Lives: " + player1.lives, 70, 35);
  }

  void scoreText() {

    //grow box with score
    int w = 0;
    if (score >= 100) {
      w = w +25;
    }
    if (score >= 1000) {
      w = w +25;
    }
    if (score >= 10000) {
      w = w +25;
    }

    stroke(white);
    fill(black);
    rect(width/2, 35, 100+w, 30, 2);
    fill(white);
    textFont(Font);
    textSize(20);
    text("Score: " + score, width/2, 35);
  }
