void pause() {
  image(Background, width/2, height/2);
  drawObjects();
  transparentBackground();
  resumeButton();
  introButton();
}

void pauseClicks() {
  //Resume Button
  if (mouseX < (width/2)+250/2 && mouseX > (width/2)-250/2 && mouseY < (height/2-50)+70/2 && mouseY > (height/2-50)-70/2) {
    mode = GAME;
  }

  //Intro Button
  if (mouseX < (width/2)+200/2 && mouseX > (width/2)-200/2 && mouseY < (height/2+50)+70/2 && mouseY > (height/2+50)-70/2) {
    mode = INTRO;
  }
}

//------------------------------------------------------------------------------------------------------------------------

void drawObjects() {
  for (GameObject obj : objects) {
    obj.show();
  }
}

void transparentBackground() {
  fill(0, 150);
  noStroke();
  rect(width/2, height/2, width, height);
}

void pauseText() {
  textFont(Font);
  fill(white);
  textSize(70);
  text("PAUSED", width/2, height/3);
}


void resumeButton() {
  textSize(30);
  fill(black, 200);
  stroke(white);
  drawSquareButton(width/2, height/2-50, 250, 70, 10, 4, 2);
  fill(white);
  text("Resume", width/2, height/2-50);
}

void introButton() {
  fill(black, 200);
  stroke(white);
  drawSquareButton(width/2, height/2+50, 200, 70, 10, 4, 2);
  fill(white);
  text("Intro", width/2, height/2+50);
}
