void intro() {
  image(Background, width/2, height/2);
  introText();
  startGameButton();
  shopButton();
  visual();
}

void introClicks() {
  //Start Button
  if (mouseX < (width/2)+250/2 && mouseX > (width/2)-250/2 && mouseY < (height/2-20)+80/2 && mouseY > (height/2-20)-80/2) {
    mode = 2;
    if (!gameInProgress) {
      initializeGame();
      gameInProgress = true;
    }
  }

  //Shop Button
  if (mouseX < (width/2)+200/2 && mouseX > (width/2)-200/2 && mouseY < (height/2+70)+60/2 && mouseY > (height/2+70)-60/2) {
    mode = 1;
  }
}

//------------------------------------------------------------------------------------------------------------------------

void visual() {
  pushMatrix();
  translate(150, height/2+60);
  scale(0.4);
  image(ArcadeMachine, 0, 0);
  popMatrix();
  AsteroidGameLeft.show();
  
  pushMatrix();
  translate(width-150, height/2+60);
  scale(0.4);
  image(ArcadeMachine, 0, 0);
  popMatrix();
  AsteroidGameRight.show();
}

void introText() {
  //Title
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(100);
  text("Asteroids", width/2, height/4);

  //Score
  stroke(orange);
  fill(orange);
  textSize(20);
  text("Points: " + points, width/2, height-160);

  //Instructions
  stroke(white);
  fill(white);
  textSize(15);
  text("WASD or Arrow Keys to move", width/2, height-125);
  text("SPACE to shoot", width/2, height-100);
}

void startGameButton() {
  stroke(white);
  noFill();
  drawSquareButton(width/2, height/2-20, 250, 80, 15, 6, 3);

  if (gameInProgress) {
    textSize(35);
    text("Resume", width/2, height/2-20);
  } else {
    textSize(30);
    text("Level " + level, width/2, height/2-20);
  }
}

void shopButton() {
  textSize(30);
  stroke(white);
  noFill();
  drawSquareButton(width/2, height/2+70, 200, 60, 15, 4, 3);
  text("Shop", width/2, height/2+70);
}
