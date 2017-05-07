class Player{    //class for the playermodel, updating the position and rendering the visual object
  PVector location;
  int size = 50;
  
  Player(float setX, float setY){    //constructor with position parameters
    location = new PVector(setX,setY);     //storing the position as a vector
  }
  
void update(){
  location.x = mouseX;    //updating the x position according to the position of the mouse
  if(location.x <= 0){    //defining the edges, where the player model has to stop.
    location.x = 0;
  }
  if(location.x >= width){
    location.x = width;
  }
}

void render(){
  pushMatrix();    //saving the current coordinate system, since I will tranform it in the following sequence 
    translate(location.x, location.y);    //translating to the x position of of the mouse
    rotate(-PI/8);    //rotating, so that the arc is directed upwards
    stroke(8);
    strokeWeight(8);
    fill(120,200);
    arc(0, 0, size, size, 0, PI+QUARTER_PI, OPEN);    //drawing the arc with an open ending
  popMatrix();
  
}
  
}