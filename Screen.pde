class Screen{
 BG bg = new BG(255);
 int c, q;
 
  Screen(){
    
  }
  
  void update(){
    bg.update();
    hover();
    clicked();
  }
  
  void render(){
   background(0);
   bg.render(); 
   
   
   
   fill(0, c, 0);
   rectMode(CENTER);
   rect(width/8, height/4, 150, 50, 10);
   
   textAlign(CENTER, CENTER);
   textSize(32);
   fill(255);
   text("Start", width/8, height/4-5);
   
   fill(q, 0, 0);
   rect(width/8, height/4 + 60, 150, 50, 10);
   
   fill(255);
   text("Afslut", width/8, height/4+55);
  }
  
  void hover(){
    if(mouseX >= width/8 - 50 && mouseX <= width/8 + 50 && mouseY >= height/4 - 25 && mouseY <= height/4 + 25){
     c = 200; 
    } else {
      c = 100;
    }
    
    if(mouseX >= width/8 - 50 && mouseX <= width/8 + 50 && mouseY >= (height/4+60) - 25 && mouseY <= (height/4+60) + 25){
     q = 200; 
    } else {
      q = 100;
    }
  }
  
  void clicked(){
    if(mouseX >= width/8 - 50 && mouseX <= width/8 + 50 && mouseY >= height/4 - 25 && mouseY <= height/4 + 25){
      if(state == 1){
        gameMode ++; 
        counter += 10;
      }
    }
  }
}