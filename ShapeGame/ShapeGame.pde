// Paul Tokhtuev | Shape Game | 3 Sept 2024
int x, y, score, tx, ty, tw, speed, shapeDist;
PImage bg1, user1, target;
import processing.sound.*;
SoundFile collide;
SoundFile death;
void setup() {
  user1=loadImage("elgato.jpg");
  bg1 =loadImage("bg1.png.png");
  target = loadImage("scoobert.jpeg");
  death= new SoundFile(this, "HighTemplar_Death4.mp3");
  size(500, 391);
  background(255, 0, 200);
    collide = new SoundFile(this, "MEOW.wav");
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

  shapeDist = int(dist(x, y, tx, ty));
  frameRate=speed+100;
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

// draw runson a 30fps

void keyPressed() {
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
