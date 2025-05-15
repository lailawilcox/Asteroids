//Asteroids Game

//Pallet
color black = #000000;
color white = #FFFFFF;
color purple = #9B35C1;
color blue = #2062E3;
color lblue = #A2D9FA;
color green = #33C152;
color dgreen = #25893B;
color orange = #E88C36;

//images
PImage Background;
PImage SpaceShip;
PImage SpaceShipBullet;
PImage Asteroid;
PImage UFO;
PImage UFOBullet;
PImage Teleport;
PImage Shield;
PImage SnowFlake;
PImage Heart;
PImage ArcadeMachine;

//Gifs
Gif AsteroidGameLeft;
Gif AsteroidGameRight;


//Fonts
PFont Font;

//Mode Framework
int mode;
final int INTRO = 0;
final int SHOP = 1;
final int SHOPshield = 11;
final int SHOPteleport = 12;
final int SHOPfreeze = 13;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//keyboard
boolean upkey, downkey, leftkey, rightkey, spacekey, oneKey, twoKey, threeKey;

//Game Objects
Spaceship player1;
UFO ufo;

//List of Game Objects
ArrayList<GameObject> objects;

//Game variables
int points;
int initialAsteroids = 1;
int ufoTimer;
boolean gameInProgress = false;
int level = 1;
int costToRebuild;

//PowerUp Variables
boolean shieldBought;
boolean teleportBought;
boolean freezeBought;

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
  Teleport = loadImage("Teleport.png");
  Teleport.resize(30, 30);
  Shield = loadImage("Shield.png");
  Shield.resize(30, 30);
  SnowFlake = loadImage("SnowFlake.png");
  SnowFlake.resize(37, 30);
  Heart = loadImage("Heart.png");
  Heart.resize(25, 25);
  ArcadeMachine = loadImage("ArcadeMachine.png");

  //Load Gif
  AsteroidGameLeft = new Gif("AsteroidGame/AsteroidGame-", ".gif", 143, 2, 150, 310, 80, 50);
  AsteroidGameRight = new Gif("AsteroidGame/AsteroidGame-", ".gif", 143, 2, width-150, 310, 80, 50);

  //Load Fonts
  Font = createFont("Font.ttf", 40);

  //Initialize Game
  initializeGame();
  shieldBought = false;
  teleportBought = false;
  freezeBought = false;
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == SHOP) shop();
  else if (mode == SHOPshield) shopShield();
  else if (mode == SHOPteleport) shopTeleport();
  else if (mode == SHOPfreeze) shopFreeze();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
