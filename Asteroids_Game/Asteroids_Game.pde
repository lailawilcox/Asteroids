//Asteroids Game

//Pallet
color black = #000000;
color white = #FFFFFF;

//images
PImage Background;
PImage SpaceShip;
PImage SpaceShipBullet;
PImage Asteroid;
PImage UFO;
PImage UFOBullet;

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
UFO ufo;

//List of Game Objects
ArrayList<GameObject> objects;

//Game variables
int score;
int highScore = 0;
int initialAsteroids = 4;
int ufoTimer;

void setup() {
  mode = 0;
  size(1000, 600);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  rectMode(CENTER);

  //Load Images
  Background = loadImage("Background.png");
  Background.resize(width+200, height);
  SpaceShip = loadImage("SpaceShip.png");
  SpaceShipBullet = loadImage("SpaceShipBullet.png");
  SpaceShipBullet.resize(35, 30);
  Asteroid = loadImage("Asteroid.png");
  UFO = loadImage("UFO.png");
  UFO.resize(100, 100);
  UFOBullet = loadImage("UFOBullet.png");
  UFOBullet.resize(35, 35);

  //Load Fonts
  Font = createFont("Font", 40);

  //Initialize Game
  initializeGame();
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
