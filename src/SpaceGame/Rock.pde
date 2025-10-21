class Rock {
  
  int x,y,diam,speed;
  PImage r1;
  
  Rock() {
    int type = int(random(1,4));
    
    r1 = loadImage("rock" + type + ".png");
    x = int(random(width));
    y = -5;
    diam = int(random(10,150));
    speed = int(random(1,5));
  }
  
  
  void display()
  {
    imageMode(CENTER);
    image(r1,x,y);
  }
  void move(){
  y += speed;
  }
}
