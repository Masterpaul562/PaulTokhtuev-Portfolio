// Paul Tokhtuev | Shape Game | 4 Sept 2025
int x, y, score, tx, ty, tw, speed, shapeDist;
PImage bg1, user1, target, bg2;
import processing.sound.*;
SoundFile collide;
SoundFile death;
int start = 0;
void setup() {
  bg2 = loadImage("Bg1.png");
  user1=loadImage("cat.png");
  bg1 =loadImage("Field.jpeg");
  target = loadImage("dog.png");
  death= new SoundFile(this, "HighTemplar_Death4.mp3");
  size(500, 500);
  background(255, 0, 200);
    collide = new SoundFile(this, "LoudMeow.mp3");
  x = 250;
  y = 250;
  score = 0;
  tx=width/2;
  ty=height/2;
  tw=50;
  speed=0;
  shapeDist=0;
};

void draw() {

  
  if(start==1){
    textSize(20);
  shapeDist = int(dist(x, y, tx, ty));
  frameRate=speed-1000000000;
  bg1.resize(500, 500);
  
  background(bg1);
  imageMode(CENTER);
  user1.resize(50, 50);
  target.resize(100, 100);
  image(user1, x, y);

  println(shapeDist);
  score();
  target();
  fill(255, 255, 0);
  stroke(-10);
  //ellipse(x, y, 20, 20);
  if (keyPressed) {
    if (key=='w'||key=='W') {
      y=y-10;
    }
    if (key=='s'||key=='S') {
      y=y+10;
    }
    if (key=='d'||key=='D') {
      x=x+10;
    }
    if (key=='a'||key=='A') {
      x=x-10;
    }
    if (x<5) {
      x=470;
    }
    if (x>490) {
      x=0;
      }
    }
  }
  else if ( start == 0) {
    
    Start();
  }
}

// draw runson a 30fps



void keyPressed() {
  start = 1;
  if (key == CODED) {
    if (keyCode == LEFT) {
      x = x-10;
    } else if (keyCode == RIGHT) {
      x = x+10;
    } else if (keyCode == UP) {
      y = y-10;
    } else if (keyCode == DOWN) {
      y = y+10;
    }
  }
}


void Start() {
  bg2.resize(500, 500);
  image(bg2,0,0);
  textSize(20);
text("Press to Start!", width/2, height/2);
textSize(10);
text("Paul Tokhtuev", width/2, height/2 +30);

textSize(10);
text("2025", width/2, height/2 +60);

}

void score() {
  rectMode(CENTER);
  fill(128);
  rect(width/2, 20, width, 40);
  fill(0);
  text("Score:"+ score, 20, 30);
  textSize(30);
  if (dist(x, y, tx, ty)<20+tw/2) {
    tx=int(random(width));
    ty=int(random(height));
    collide.play();
    score=score+10;
    tw=tw+30;
    speed=speed+1;
  }
};
void target() {
  //rect(tx, ty, tw, tw);
  image(target, tx, ty, tw, tw);
  tw=tw-1;
  if (tw==0) {
    gameOver();
  }
}
void gameOver() {
  background(0);
  death.play();
  fill(255);
  text("GAME OVER!", width/2, height/2);
  noLoop();
};
