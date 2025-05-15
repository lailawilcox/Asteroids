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

  //Shield Button
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

  textSize(30);
  text("Score: " + points, width/2, height/2-120);
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

  image(Shield, width/2-300, height/2+50, 100, 100);

  strokeWeight(5);
  noFill();

  if (!shieldBought) {
    fill(black, 180);
    rect(width/2-300, height/2+50, 150, 150, 10);
  }

  drawSquareButton(width/2-300, height/2+50, 150, 150, 10, 10, 5);
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
  textSize(13);

  if (!shieldBought) {
    text("Press 1 for Shield", width/2-300, height-125);
  } else {
    text("Press 1 for Shield", width/2-300, height-100);
  }

  if (!shieldBought) {
    //Buy Box
    fill(green, 20);
    stroke(dgreen);
    strokeWeight(2);
    drawSquareButton(width/2-300, height-85, 200, 40, 10, 5, 2);

    //Buy Text
    stroke(white);
    fill(white);
    textFont(Font);
    textSize(10);
    text("1 000 Points", width/2-300, height-85);
  }
}

void shopShieldClicks() {
  //Exit Button
  if (mouseX > (width/2-300)+300/2 || mouseX < (width/2-300)-300/2 || mouseY > (height-100)+100/2 || mouseY < (height-100)-100/2) {
    mode = 1;
  }

  //Buy Button
  if (points >= 1000 && !shieldBought && mouseX < (width/2-300)+200/2 && mouseX > (width/2-300)-200/2 && mouseY < (height-85)+40/2 && mouseY > (height-85)-40/2) {
    points -= 1000;
    shieldBought = true;
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
  image(Teleport, width/2, height/2+50, 100, 100);

  strokeWeight(5);
  noFill();

  if (!teleportBought) {
    fill(black, 180);
    rect(width/2, height/2+50, 150, 150, 10);
  }

  drawSquareButton(width/2, height/2+50, 150, 150, 10, 10, 5);
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
  textSize(13);

  if (!teleportBought) {
    text("Press 2 for Teleport", width/2, height-125);
  } else {
    text("Press 2 for Teleport", width/2, height-100);
  }


  if (!teleportBought) {
    //Buy Box
    fill(green, 20);
    stroke(dgreen);
    strokeWeight(2);
    drawSquareButton(width/2, height-85, 200, 40, 10, 5, 2);

    //Buy Text
    stroke(white);
    fill(white);
    textFont(Font);
    textSize(10);
    text("10 000 Points", width/2, height-85);
  }
}

void shopTeleportClicks() {
  //Exit Button
  if (mouseX > (width/2)+300/2 || mouseX < (width/2)-300/2 || mouseY > (height-100)+100/2 || mouseY < (height-100)-100/2) {
    mode = 1;
  }

  //Buy Button
  if (points >= 10000 && !teleportBought && mouseX < (width/2)+300/2 && mouseX > (width/2)-300/2 && mouseY < (height-100)+100/2 && mouseY > (height-100)-100/2) {
    points -= 10000;
    teleportBought = true;
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
  image(SnowFlake, width/2+297, height/2+50, 140, 100);

  strokeWeight(5);
  noFill();

  if (!freezeBought) {
    fill(black, 180);
    rect(width/2+300, height/2+50, 150, 150, 10);
  }

  drawSquareButton(width/2+300, height/2+50, 150, 150, 10, 10, 5);
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
  textSize(13);
  if (!freezeBought) {
    text("Press 3 for Freeze", width/2+300, height-125);
  } else {
    text("Press 3 for Freeze", width/2+300, height-100);
  }

  if (!freezeBought) {
    //Buy Box
    fill(green, 20);
    stroke(dgreen);
    strokeWeight(2);
    drawSquareButton(width/2+300, height-85, 200, 40, 10, 5, 2);

    //Buy Text
    stroke(white);
    fill(white);
    textFont(Font);
    textSize(10);
    text("100 000 Points", width/2+300, height-85);
  }
}

void shopFreezeClicks() {
  //Exit Button
  if (mouseX > (width/2+300)+300/2 || mouseX < (width/2+300)-300/2 || mouseY > (height-100)+100/2 || mouseY < (height-100)-100/2) {
    mode = 1;
  }

  //Buy Button
  if (points >= 100000 && !freezeBought && mouseX < (width/2+300)+300/2 && mouseX > (width/2+300)-300/2 && mouseY < (height-100)+100/2 && mouseY > (height-100)-100/2) {
    points -= 100000;
    freezeBought = true;
    mode = 1;
  }
}

//------------------------------------------------------------------------------------------------------------------------
