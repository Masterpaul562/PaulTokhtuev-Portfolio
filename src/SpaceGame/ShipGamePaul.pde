
SpaceShip spaceShip;
import processing.sound.*;
Timer rockTimer, starTimer, powupTimer;
ArrayList<Lazer> lazer = new ArrayList<Lazer>();
ArrayList<Rock> rock = new ArrayList<Rock>();
ArrayList<Star> star = new ArrayList<Star>();
ArrayList<PowerUp> powup = new ArrayList<PowerUp>();
int score, rocksPassed, ammo;
boolean start,gameOver;
PImage startScreen;
float hitPercentage,shotsFired,shotHits;
SoundFile crash;

void setup () {
  startScreen = loadImage("SpaceGameStart.png");
  crash = new SoundFile(this,"crashEffect.mp3");
  ammo = 1000;
  score = 0;
  size(500, 500);
  background(0, 0, 0);
  spaceShip = new SpaceShip();
  rockTimer = new Timer(3000);
  rockTimer.start();
  starTimer = new Timer(100);
  starTimer.start();
  powupTimer = new Timer(10000);
  powupTimer.start();
}


void draw()
{
  if(start&&!gameOver) {
  //addes powerups
  if (powupTimer.isFinished()) {
    powup.add(new PowerUp());
    powupTimer.start();
  }
  if (starTimer.isFinished()) {
    star.add(new Star());
    starTimer = new Timer(int(random(20, 200)));
    starTimer.start();
  }

  if (rockTimer.isFinished()) {

    rock.add(new Rock());

    rockTimer = new Timer(int (random(100, 2500)));
    rockTimer.start();
  }
  background(20);
  displayScore();
  spaceShip.spaceShip(mouseX, mouseY);
  for (int i = 0; i < star.size(); i++) {
    Star stars = star.get(i);

    stars.display();
    stars.move();
    if (stars.y>height) {
      star.remove(i);
    }
  }

  for (int i = 0; i < powup.size(); i++) {
    PowerUp powups = powup.get(i);

    powups.display();
    powups.move();
    if (dist(powups.x, powups.y, mouseX, mouseY)<40) {
      if (powups.type == 'a') {
        ammo += 100;
        powup.remove(powups);
      } else if (powups.type == 't') {
        spaceShip.turretAmount ++;
         powup.remove(powups);
        if (spaceShip.turretAmount>5) {
          spaceShip.turretAmount = 5;
        }
      }
    }
    if ( powups.y>height) {
      powup.remove(powups);
    }
  }
//moves lazers and removes them if they are high enough
  for (int i = 0; i < lazer.size(); i++)
  {
    Lazer lazers = lazer.get(i);

    lazers.display();
    lazers.move();

    if (lazers.posY<0) {
      lazer.remove(i);
    }
  }

  for (int i = 0; i < rock.size(); i++)
  {
    Rock rocks = rock.get(i);

    rocks.display();
    rocks.move();
    if (dist(rocks.x, rocks.y, mouseX, mouseY) < 40) {
      spaceShip.lives --;
      spaceShip.turretAmount = 1;
      crash.play();
      rock.remove(i);
    }

    for (int x =0; x<lazer.size(); x++) {
      Lazer lazers = lazer.get(x);
      //print(dist(lazers.posX, lazers.posY, rocks.x, rocks.y)+ "  ");

      if ( dist(lazers.posX, lazers.posY, rocks.x, rocks.y) < 30) {
        score++;
        shotHits++;
        rock.remove(i);
        lazer.remove(x);
      }
    }
    if (rocks.y>height) {
      rock.remove(i);
      rocksPassed++;
    }
  }
  if (spaceShip.lives <= 0||rocksPassed>10) {
    gameOver();
  }
  
  }else  {
    if(!start){
  StartScreen();
    }
  }
}

void StartScreen(){
  image(startScreen,0,0);
}
void mousePressed() {
  if(!start){
  start = true;
  }
  if(gameOver) {
    restart();
  }
  if (ammo > 0) {
   
      if (spaceShip.turretAmount == 1){
    lazer.add(new Lazer(0));
      }else if (spaceShip.turretAmount == 2){
        print("YAY");
        lazer.add(new Lazer(0));
        lazer.add(new Lazer(30));
      }else if (spaceShip.turretAmount == 3){
        lazer.add(new Lazer(0));
        lazer.add(new Lazer(30));
        lazer.add(new Lazer(-30));
      }else if (spaceShip.turretAmount == 4){
        lazer.add(new Lazer(0));
        lazer.add(new Lazer(30));
        lazer.add(new Lazer(-30));
        lazer.add(new Lazer(60));
      }else if (spaceShip.turretAmount == 5){
        lazer.add(new Lazer(0));
        lazer.add(new Lazer(30));
        lazer.add(new Lazer(-30));
        lazer.add(new Lazer(60));
        lazer.add(new Lazer(-60));
      }
    shotsFired++;
    ammo--;
    }
  }

//Displays everything
void displayScore() {
  fill(100);
  rect(width/2, 10, width, 65);
  textSize(20);
  fill(255);
  text("score: "+score, (width/2)-20, 25);
  text("ammo: "+ammo, (width/2)+60, 25);
  text("rocks: "+rock.size(), (width/2)-245, 25);
  text("rocks passed: "+rocksPassed, (width/2)-170, 25);
  text("lives: "+spaceShip.lives, (width/2)+180, 25);
}
//restarts all things for restart
void restart() {
  //print("yay");
  gameOver = false;
  start = true;
  ammo = 1000;
  spaceShip.lives = 3;
  score = 0;
  shotsFired = 0;
  shotHits = 0;
  
  rocksPassed = 0;
  rockTimer.start();
  powupTimer.start();
  for(int i = 0; i < rock.size(); i++) {
   rock.remove(i); 
  }
  for(int i = 0; i < lazer.size(); i++) {
   lazer.remove(i); 
  }
  
}
//gameOver screen
void gameOver() {

  background(0);
  fill(255);
  text("GAME OVER!", width/2, height/2);
  text("score: "+score, width/2, (height/2)+100);
  text("Shots fired: "+shotsFired, width/2-150, (height/2)+100);
  text("Shots Hit: "+shotHits, width/2+100, (height/2)+100);
  print(shotHits);
  hitPercentage = (shotHits/shotsFired)*100;
  text("Accuracy: "+ hitPercentage+ "%", width/2+100, (height/2)+200);
  text("Press Mouse to Restart ", width/2-10, (height/2)-100);
  gameOver = true;
}
