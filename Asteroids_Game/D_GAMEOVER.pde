void gameOver() {
  image(Background, width/2, height/2);
  gameoverText();
  restartButton();
}

void gameOverClicks() {
  if (mouseX < (width/2)+250/2 && mouseX > (width/2)-250/2 && mouseY < (height/2-20)+80/2 && mouseY > (height/2-20)-80/2) {
    mode = 0;
    initializeGame();
  }
}

//------------------------------------------------------------------------------------------------------------------------

void gameoverText() {
  //Title
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(100);
  text("GAMEOVER", width/2, height/4);

  //High score
  stroke(white);
  fill(white);
  textSize(25);
  text("High Score: " + highScore, width/2, height/3 + 170);
}

void restartButton() {
  textSize(50);
  stroke(white);
  noFill();
  drawSquareButton(width/2, height/2-20, 250, 80, 15, 6, 3);
  text("Restart", width/2, height/2-20);
}
