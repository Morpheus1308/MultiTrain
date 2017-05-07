class About{    //Class as a type to define the implementation of the about section in the game - contains two methods, update and render
  About(){
    
  }
  
  void update(){
    
    if(mouseX >= width/2+((width/1.2)/2)-15 && mouseX <= width/2+((width/1.2)/2)+15 && mouseY >= height/2-((height/1.2)/2)-15 && mouseY <= height/2-((height/1.2)/2)+15){    //checking if the right upper button has been pressed - if yes, go back
      if(state == 1){
        start.next = 0; 
      }
    }
  }
  
  void render(){
   rectMode(CENTER);    //All the rectangles in the program are using the CENTER mode, because is was easier to work with together with the text
   stroke(255);
   fill(120,245);    //fill used the arguments as color and alpha
   rect(width/2, height/2, width/1.2, height/1.2);    //In order to generate a moderately sizeable program, there will be a great use of size definitions as Width or Height
   
   fill(255);
   textSize(50);
   textAlign(CENTER,CENTER);    //placing the text in the center
   text("Hi", width/4+50, height/3);
   
   fill(255);
   textSize(20);
   textAlign(CENTER,CENTER);
   text("The purpose of this game is", width/4+50, height/3+70);
   text("to teach you the multiplication table!", width/4+50, height/3+90);
   
   rect(width/2+((width/1.2)/2), height/2-((height/1.2)/2), 30,30);
   pushMatrix();                                                            //saves the current coordinate system, while popMatrix restores it later on- used because of the translation
     translate(width/2+((width/1.2)/2), height/2-((height/1.2)/2));
     fill(120);
     noStroke();
     rect(0, 0,20, 5); 
     rect(0, 0,5, 20); 
   popMatrix();
  }
}