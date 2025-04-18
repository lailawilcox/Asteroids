void mouseReleased () {
  if (mode == INTRO) introClicks();
  else if (mode == GAME) gameClicks();
  else if (mode == PAUSE) pauseClicks();
  else if (mode == GAMEOVER) gameOverClicks();
}

void keyPressed() {
  if (key == 'w' || key == 'W') upkey  = true;
  if (key == 's' || key == 'S') downkey  = true;
  if (key == 'a' || key == 'A') leftkey  = true;
  if (key == 'd' || key == 'D') rightkey  = true;

  if (keyCode == UP) upkey  = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey= true;

  if (key == 'z' || key == 'Z') zkey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') upkey  = false;
  if (key == 's' || key == 'S') downkey  = false;
  if (key == 'a' || key == 'A') leftkey  = false;
  if (key == 'd' || key == 'D') rightkey  = false;

  if (keyCode == UP) upkey  = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey= false;

  if (key == 'z' || key == 'Z') zkey = false;
  if (key == ' ') spacekey = false;
}
