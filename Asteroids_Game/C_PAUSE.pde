void pause() {
  darkBackground();
  playButton();
  introButton();
  resumeButton();
}

void pauseClicks() {
  if (mouseX < (width-35)+30/2 && mouseX > (width-35)-30/2 && mouseY < 35+30/2 && mouseY > 35-30/2) {
    mode = 1;
  }
}

//------------------------------------------------------------------------------------------------------------------------

void playButton() {
  fill(black);
  stroke(black);
  rect(width-35, 35, 32, 32);
  stroke(white);
  drawSquareButton(width-35, 35, 30, 30, 2, 4, 2);
  strokeWeight(2);
  fill(white);
  triangle(width-39, 41, width-39, 29, width-31, 35);
}

void introButton() {
  textSize(30);
  stroke(white);
  fill(black);
  drawSquareButton(width/2, (height/2)+50, 120, 50, 5, 4, 2);
  text("Intro", width/2, (height/2)+50);
}

void resumeButton() {
  textSize(30);
  stroke(white);
  fill(black);
  drawSquareButton(width/2, (height/2)-50, 150, 50, 5, 4, 2);
  text("Resume", width/2, (height/2)-50);
}

void darkBackground() {
  fill(black, 5);
  noStroke();
  rect(width/2, height/2, width, height);
}
