void intro() {
  image(Background, width/2, height/2);
  introText();
  startGameButton();
  shopButton();
}

void introClicks() {
  //Start Button
  if (mouseX < (width/2)+250/2 && mouseX > (width/2)-250/2 && mouseY < (height/2-20)+80/2 && mouseY > (height/2-20)-80/2) {
    mode = 2;
   initializeGame();
  }
  
  //Shop Button
  if (mouseX < (width/2)+200/2 && mouseX > (width/2)-200/2 && mouseY < (height/2+70)+60/2 && mouseY > (height/2+70)-60/2) {
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
  text("High Score: " + highScore, width/2, height-160);

  //Instructions
  stroke(white);
  fill(white);
  textSize(15);
  text("WASD or Arrow Keys to move", width/2, height-125);
  text("SPACE to shoot, Z to teleport", width/2, height-100);
}

void startGameButton() {
  textSize(40);
  stroke(white);
  noFill();
  drawSquareButton(width/2, height/2-20, 250, 80, 15, 6, 3);
  text("Start", width/2, height/2-20);
}

void shopButton() {
  textSize(30);
  stroke(white);
  noFill();
  drawSquareButton(width/2, height/2+70, 200, 60, 15, 4, 3);
  text("Shop", width/2, height/2+70);
}
