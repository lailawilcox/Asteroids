void mouseReleased () {
  if (mode == INTRO) introClicks();
  else if (mode == SHOP) shopClicks();
  else if (mode == SHOPshield) shopShieldClicks();
  else if (mode == SHOPteleport) shopTeleportClicks();
  else if (mode == SHOPfreeze) shopFreezeClicks();
  else if (mode == GAME) gameClicks();
  else if (mode == PAUSE) pauseClicks();
  else if (mode == GAMEOVER) gameOverClicks();
}

void keyPressed() {
  //Move
  if (key == 'w' || key == 'W') upkey  = true;
  if (key == 's' || key == 'S') downkey  = true;
  if (key == 'a' || key == 'A') leftkey  = true;
  if (key == 'd' || key == 'D') rightkey  = true;

  if (keyCode == UP) upkey  = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey= true;

  //Shoot
  if (key == ' ') spacekey = true;

  //Shield
  if (key == '1' || key == '!') oneKey = true;
  //Teleport
  if (key == '2' || key == '@') twoKey = true;
  //Freeze
  if (key == '3' || key == '#') threeKey = true;
}

void keyReleased() {
  //Move
  if (key == 'w' || key == 'W') upkey  = false;
  if (key == 's' || key == 'S') downkey  = false;
  if (key == 'a' || key == 'A') leftkey  = false;
  if (key == 'd' || key == 'D') rightkey  = false;

  if (keyCode == UP) upkey  = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey= false;

  //Shoot
  if (key == ' ') spacekey = false;

  //Shield
  if (key == '1' || key == '!') oneKey = false;
  //Teleport
  if (key == '2' || key == '@') twoKey = false;
  //Freeze
  if (key == '3' || key == '#') threeKey = false;
}
