void shop() {
  image(Background, width/2, height/2);
  shopText();

  shieldButton();
  teleportButton();
  freezeButton();
}

void shopClicks() {
}

//------------------------------------------------------------------------------------------------------------------------

void shopText() {
  stroke(white);
  fill(white);
  textFont(Font);
  textSize(80);
  text("Shop", width/2, height/4);
}

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

void shopShield(){
  
}

void shopShieldClicks(){
  
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

void shopTeleport(){
  
}

void shopTeleportClicks(){
  
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

void shopFreeze(){
  
}

void shopFreezeClicks(){
  
}

//------------------------------------------------------------------------------------------------------------------------
