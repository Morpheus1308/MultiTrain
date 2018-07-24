public class Player{    //class for the playermodel, updating the position  - parent for the specifik player classes
  float size;
  float x, y;   //position variables
  PVector location;    //vector to store the location
  
public void update(){
  if(location.x <= 0){    //defining the edgeson the axis, where the player model has to stop.
    location.x = 0;
  }
  if(location.x >= width){
    location.x = width;
  }
  if(location.y <= 0){    //defining the edges on the y axis, where the player model has to stop.
    location.y = 0;
  }
  if(location.y >= height){
    location.y = height;
  }
}

public void render(){
  }
}

class ArcType extends Player{    //player class inheriting from the player class
  ArcType(float setX, float setY, float setSize){    //constructor with parameters for the position and the size
    x = setX;
    y = setY;
    size = setSize;
    location = new PVector(x,y);    //initializing the location vector.
  }
  
  void update(){
    location.x = mouseX;    //updating the x position according to the position of the mouse
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