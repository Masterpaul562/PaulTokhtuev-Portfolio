class PowerUp {
  
  int x,y,diam,speed;

  char type;
  
  PowerUp() {
    int randtype = int(random(1,3));
    if(randtype == 1) {
    type = 'a';
    }else {
    type = 't';
    }
   
    x = int(random(width));
    y = -5;
    diam = 50;
    speed = int(random(1,5));
  }
  
  
  void display()
  {
   if(type == 'a'){
     fill(255,255,0);
     ellipse(x,y,diam,diam);
   }
   if(type == 't'){
     fill(0,255,255);
      ellipse(x,y,diam,diam);
   }
   
  }
  void move(){
  y += speed;
  }
}
