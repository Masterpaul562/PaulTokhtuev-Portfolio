class Lazer 
{
  int posX, posY;
  PImage lazer;
  
  Lazer(int offset)
  {
    posX = mouseX +offset;
    posY = mouseY;
    lazer = loadImage("lazer.png");
  }
  
  void display() 
  {
    
    imageMode(CENTER);
    lazer.resize(0,50);
    image(lazer,posX,posY);
  }
  void move()
  {    
    posY = posY - 3;
    
  }
  
}
  
  
  
  
  
  
  
