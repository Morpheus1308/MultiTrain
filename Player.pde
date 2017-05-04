class Player{
  PVector location;
  int size = 50;
  
  Player(float setX, float setY){
    location = new PVector(setX,setY);
  }
  
void update(){
  location.x = mouseX;
  if(location.x <= 0){
    location.x = 0;
  }
  if(location.x >= width){
    location.x = width;
  }
}

void render(){
  fill(0);
  rectMode(CENTER);
  rect(location.x,location.y, size, size);
  
}
  
}