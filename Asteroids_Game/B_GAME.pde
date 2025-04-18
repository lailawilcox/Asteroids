void game() {
  image(Background, width/2, height/2);

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
  pauseButton();
}

void gameClicks() {
  if (mouseX < (width-35)+30/2 && mouseX > (width-35)-30/2 && mouseY < 35+30/2 && mouseY > 35-30/2) {
    mode = 2;
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
