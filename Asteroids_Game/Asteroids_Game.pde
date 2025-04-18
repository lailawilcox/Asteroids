//Asteroids Game

//Pallet
color black = #000000;
color white = #FFFFFF;

//images
PImage Background;
PImage SpaceShip;
PImage Bullet;
PImage Asteroid;
PImage UFO;

//Fonts
PFont Font;

//Mode Framework
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//keyboard
boolean upkey, downkey, leftkey, rightkey, spacekey, zkey;

//Game Objects
Spaceship player1;

//List of Game Objects
ArrayList<GameObject> objects;

//Game variables
int score;
int highScore = 0;
int initialAsteroids = 4;
boolean playerWon = false;

void setup() {
  mode = 0;
  size(800, 600);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  rectMode(CENTER);

  //Load images
  Background = loadImage("Background.png");
  Background.resize(width+200, height);
  SpaceShip = loadImage("SpaceShip.png");
  Bullet = loadImage("Bullet.png");
  Asteroid = loadImage("Asteroid.png");
  UFO = loadImage("UFO.png");

  //Load fonts
  Font = createFont("Font", 40);

  initializeGame();
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
