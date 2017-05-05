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
  pushMatrix();
    translate(location.x, location.y);
    rotate(-PI/8);
    stroke(8);
    strokeWeight(8);
    fill(120,200);
    arc(0, 0, size, size, 0, PI+QUARTER_PI, OPEN);
  popMatrix();
  //fill(0);
  //rectMode(CENTER);
  //rect(location.x,location.y, size, size);
  
}
  
}