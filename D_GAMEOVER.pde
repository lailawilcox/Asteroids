void gameOver() {
  image(Background, width/2, height/2);

  costToRebuild = (int)points/2;

  if (player1.lives == 0) {
    levelLost();
  } else {
    levelPast();
  }
}

void gameOverClicks() {
  //Restart/Home Button
  if (mouseX < (width/2)+250/2 && mouseX > (width/2)-250/2 && mouseY < (height/2+80)+80/2 && mouseY > (height/2+80)-80/2) {
    if (player1.lives == 0) {
      mode = 0;
      gameInProgress = false;
      level = 1;
      if (points <= 1) {
        points = 0;
      }
    } else {
      mode = 2;
      level += 1;
      initializeGame();
    }
  }

  //Rebuild Buton

  if (mouseX < (width/2+80)+160/2 && mouseX > (width/2+80)-160/2 && mouseY < (height-120)+60/2 && mouseY > (height-120)-60/2) {
    if (player1.lives == 0 && points >= costToRebuild && points > 1) {
      points -= costToRebuild;
      mode = 2;
      initializeGame();
    }
  }
}

//------------------------------------------------------------------------------------------------------------------------

void levelLost() {
  //Title
  stroke(white);
  fill(white);
  textFont(Font);

  //Title
  textSize(40);
  text("Level " + level + " Lost", width/2, height/4-20);

  //Message
  textSize(20);
  text("Your Ship was Destroyed! You can Rebuild Using Half of Your Points (if you have any) and Try to Clear the Area Again or Return Home and Start From Level 1 Again but Keep All Your Points", width/2, height/2-50, 950, 500);

  //Home Button
  noFill();
  textSize(30);
  drawSquareButton(width/2, height/2+80, 250, 80, 15, 6, 3);
  text("Home", width/2, height/2+80);

  if (points > 1) {
    //Rebuild Text
    noFill();
    textSize(20);
    strokeWeight(3);
    text("Rebuild Ship", width/2-90, height-120, 150, 200);

    //Rebuild Box
    fill(green);
    stroke(dgreen);
    drawSquareButton(width/2+80, height-120, 160, 60, 10, 6, 3);

    stroke(white);
    fill(white);
    text("" + costToRebuild, width/2+80, height-120, 160, 60);

    //Points Text
    textSize(20);
    fill(orange);
    text("Points: " + points, width/2, height-50);
  }
}

void levelPast() {
  stroke(white);
  fill(white);
  textFont(Font);

  //Title
  textSize(50);
  text("Level " + level + " Passed!", width/2, height/4);

  //Message
  textSize(20);
  text("You Sucessfully Destroyed all the Asteroids and Enemy Ships! Continue to the Next Area to Clear More Asteroids", width/2, height/2-50, 950, 500);

  //Next Level Button
  noFill();
  textSize(20);
  drawSquareButton(width/2, height/2+50, 250, 80, 15, 6, 3);
  text("Next Level", width/2, height/2+50);
}
