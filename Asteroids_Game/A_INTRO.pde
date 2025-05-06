void intro() {
  image(Background, width/2, height/2);
  introText();
  startGameButton();
}

void introClicks() {
  //Start Button
  if (mouseX < (width/2)+250/2 && mouseX > (width/2)-250/2 && mouseY < (height/2-20)+80/2 && mouseY > (height/2-20)-80/2) {
    mode = 1;
   initializeGame();
  }
}

//------------------------------------------------------------------------------------------------------------------------

void introText() {
  //Title
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(100);
  text("Asteroids", width/2, height/4);

  //High score
  stroke(white);
  fill(white);
  textSize(20);
  text("High Score: " + highScore, width/2, height/3 + 170);

  //Instructions
  stroke(white);
  fill(white);
  textSize(15);
  text("WASD or Arrow Keys to move", width/2, height*2/3+20);
  text("SPACE to shoot, Z to teleport", width/2, height*2/3 + 50);
}

void startGameButton() {
  textSize(40);
  stroke(white);
  noFill();
  drawSquareButton(width/2, height/2-20, 250, 80, 15, 6, 3);
  text("Start", width/2, height/2-20);
}
