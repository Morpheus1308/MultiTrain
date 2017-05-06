class About{
  int c;
  About(){
    
  }
  
  void update(){
    
    if(mouseX >= width/2+((width/1.2)/2)-15 && mouseX <= width/2+((width/1.2)/2)+15 && mouseY >= height/2-((height/1.2)/2)-15 && mouseY <= height/2-((height/1.2)/2)+15){
      if(state == 1){
        start.next = 0; 
      }
    }
  }
  
  void render(){
   rectMode(CENTER);
   stroke(255);
   fill(120,245);
   rect(width/2, height/2, width/1.2, height/1.2);
   
   fill(255);
   textSize(50);
   textAlign(CENTER,CENTER);
   text("Hi", width/4+50, height/3);
   
   fill(255);
   textSize(20);
   textAlign(CENTER,CENTER);
   text("The purpose of this game is", width/4+50, height/3+70);
   text("to teach you the multiplication table!", width/4+50, height/3+90);
   
   rect(width/2+((width/1.2)/2), height/2-((height/1.2)/2), 30,30);
   pushMatrix();
     translate(width/2+((width/1.2)/2), height/2-((height/1.2)/2));
     fill(120);
     noStroke();
     rect(0, 0,20, 5); 
     rect(0, 0,5, 20); 
   popMatrix();
  }
}