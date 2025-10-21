
class SpaceShip {
  int lives,xpos,ypos,turretAmount;
  
  
  SpaceShip(){
    turretAmount = 1;
    lives = 3;
  }

  void spaceShip(int x, int y) {
    xpos = x;
    ypos = y;
    rectMode(CENTER);
    stroke(22);
    strokeWeight(3);
    line(x+10, y+20, x+10, y-20);
    fill(255, 15, 224);
    triangle(x-20, y-20, x-60, y, x-20, y);
    triangle(x+20, y-20, x+60, y, x+20, y);
    triangle(x+20, y+30, x+40, y+50, x+20, y+50);
    triangle(x-20, y+30, x-40, y+50, x-20, y+50);

    rect(x, y, 50, 80);
    fill(255);
    stroke(0);
    ellipse(x, y-30, 20, 20);
  }
}
