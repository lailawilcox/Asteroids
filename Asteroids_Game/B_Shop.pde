void shop() {
  image(Background, width/2, height/2);
  shopText();
  homeButton();

  shieldButton();
  teleportButton();
  freezeButton();
}

void shopClicks() {
  //Home Button
  if (mouseX < (width-35)+30/2 && mouseX > (width-35)-30/2 && mouseY < 35+30/2 && mouseY > 35-30/2) {
    mode = 0;
  }

  //Sheild Button
  if (mouseX < (width/2-300)+150/2 && mouseX > (width/2-300)-150/2 && mouseY < (height/2+50)+150/2 && mouseY > (height/2+50)-150/2) {
    mode = 11;
  }

  //Teleport Button
  if (mouseX < (width/2)+150/2 && mouseX > (width/2)-150/2 && mouseY < (height/2+50)+150/2 && mouseY > (height/2+50)-150/2) {
    mode = 12;
  }

  //Freeze Button
  if (mouseX < (width/2+300)+150/2 && mouseX > (width/2+300)-150/2 && mouseY < (height/2+50)+150/2 && mouseY > (height/2+50)-150/2) {
    mode = 13;
  }
}

//------------------------------------------------------------------------------------------------------------------------

void shopText() {
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(80);
  text("Shop", width/2, height/4-50);
}

void homeButton() {
  fill(black);
  stroke(white);
  drawSquareButton(width-35, 35, 30, 30, 2, 4, 2);
  strokeWeight(2);
  fill(white);
  rect(width-35, 38, 10, 10);
  triangle(width-43, 32, width-27, 32, width-35, 25);
  fill(black);
  noStroke();
  rect(width-34.5, 40, 5, 8);
}

//------------------------------------------------------------------------------------------------------------------------

void shieldButton() {
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(20);
  text("Shield", width/2-300, height/2-50);

  strokeWeight(5);
  noFill();
  drawSquareButton(width/2-300, height/2+50, 150, 150, 10, 10, 5);
  image(Shield, width/2-300, height/2+50, 100, 100);

  fill(black, 180);
  rect(width/2-300, height/2+50, 150, 150, 10);
}

void shopShield() {
  //Box
  stroke(white);
  strokeWeight(5);
  noFill();
  rect(width/2-300, height-100, 300, 100, 10);

  //Text
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(10);
  text("Press 1 to activate", width/2-300, height-125);
  text("the Shield", width/2-300, height-105);
}

void shopShieldClicks() {
  //Exit Button
  if (mouseX > (width/2-300)+300/2 || mouseX < (width/2-300)-300/2 || mouseY > (height-100)+100/2 || mouseY < (height-100)-100/2) {
    mode = 1;
  }
}

//------------------------------------------------------------------------------------------------------------------------

void teleportButton() {
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(20);
  text("Teleport", width/2, height/2-50);

  strokeWeight(5);
  noFill();
  drawSquareButton(width/2, height/2+50, 150, 150, 10, 10, 5);
  image(Teleport, width/2, height/2+50, 100, 100);

  fill(black, 180);
  rect(width/2, height/2+50, 150, 150, 10);
}

void shopTeleport() {
  //Box
  stroke(white);
  strokeWeight(5);
  noFill();
  rect(width/2, height-100, 300, 100, 10);

  //Text
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(10);
  text("Press 2 to Teleport", width/2, height-125);

}

void shopTeleportClicks() {
  //Exit Button
  if (mouseX > (width/2)+300/2 || mouseX < (width/2)-300/2 || mouseY > (height-100)+100/2 || mouseY < (height-100)-100/2) {
    mode = 1;
  }
}

//------------------------------------------------------------------------------------------------------------------------

void freezeButton() {
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(20);
  text("Freeze", width/2+300, height/2-50);

  strokeWeight(5);
  noFill();
  drawSquareButton(width/2+300, height/2+50, 150, 150, 10, 10, 5);
  image(SnowFlake, width/2+297, height/2+50, 140, 100);

  fill(black, 180);
  rect(width/2+300, height/2+50, 150, 150, 10);
}

void shopFreeze() {
  //Box
  stroke(white);
  strokeWeight(5);
  noFill();
  rect(width/2+300, height-100, 300, 100, 10);

  //Text
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(10);
  text("Press 3 to Freeze", width/2+300, height-125);
  
  //Buy Box
  fill(green, 20);
  rect(width/2+300, height-100, 300, 100, 10);
}

void shopFreezeClicks() {
  //Exit Button
  if (mouseX > (width/2+300)+300/2 || mouseX < (width/2+300)-300/2 || mouseY > (height-100)+100/2 || mouseY < (height-100)-100/2) {
    mode = 1;
  }
}

//------------------------------------------------------------------------------------------------------------------------
