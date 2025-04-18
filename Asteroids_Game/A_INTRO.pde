void intro() {
  image(Background, width/2, height/2);
  backgroundEffects();
  introText();
  startGameButton();
}

void introClicks() {
  if (mouseX < (width/2)+250/2 && mouseX > (width/2)-250/2 && mouseY < (height/2-20)+80/2 && mouseY > (height/2-20)-80/2) {
    mode = 1;
  }
}

//------------------------------------------------------------------------------------------------------------------------

void introText() {
  //Title
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(100);
  stroke(white);
  text("Asteroids", width/2, height/4);

  //High score
  stroke(white);
  fill(white);
  textSize(25);
  text("High Score: " + highScore, width/2, height/3 + 170);

  //Instructions
  stroke(white);
  fill(white);
  textSize(20);
  text("WASD or Arrow Keys to move", width/2, height*2/3+20);
  text("SPACE to shoot, Z to teleport", width/2, height*2/3 + 50);
}

void startGameButton() {
  textSize(50);
  fill(white);
  stroke(white);
  noFill();
  drawSquareButton(width/2, height/2-20, 250, 80, 5, 8, 4);
  text("Start", width/2, height/2-20);
}

void backgroundEffects() {
  for (int i = 0; i < 5; i++) {
    float x = random(width);
    float y = random(height);
    float size = random(1, 4);
    fill(white, 150);
    noStroke();
    ellipse(x, y, size, size);
  }
}
