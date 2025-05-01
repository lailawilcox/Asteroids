void gameOver() {
  image(Background, width/2, height/2);
  youLoseText();
  restartButton();
}

void gameOverClicks() {
  //restart button
  if (mouseX < (width/2)+250/2 && mouseX > (width/2)-250/2 && mouseY < (height/2+50)+80/2 && mouseY > (height/2+50)-80/2) {
    mode = 0;
    initializeGame();
  }
}

//------------------------------------------------------------------------------------------------------------------------

void youLoseText() {
  //Title
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(100);
  text("GAMEOVER", width/2, height/4);

  //Win/Lose Text
  stroke(white);
  fill(white);
  textSize(30);
  if (objects.size() == 1) {
    text("You Sucessfully Destroyed all the Asteroids and Enemy Ships", width/2, height/2-50, 600, 500);
  } else if (player1.lives == 0) {
    text("Your Ship Was Destroyed by Asteroids", width/2, height/2-50);
  }

  //High score
  stroke(white);
  fill(white);
  textSize(25);
  text("High Score: " + highScore, width/2, height/2-50 + 170);
}

void restartButton() {
  textSize(50);
  stroke(white);
  noFill();
  drawSquareButton(width/2, height/2+50, 250, 80, 15, 6, 3);
  text("Restart", width/2, height/2+50);
}
