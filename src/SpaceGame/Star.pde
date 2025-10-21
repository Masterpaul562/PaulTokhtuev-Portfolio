class Star {
  int x,y,w,speed;
  
  Star() {
  
  x = int(random(0,width));
  y = -10;
  w = int(random(1,4));
  speed = int(random(2,8));
  
  }
  
  void display(){
    fill(random(190,200),random(190,200),0);
    noStroke();
    ellipse(x,y,w,w);
    
  }
  void move() {
    y += speed;
  }
  
  
}
