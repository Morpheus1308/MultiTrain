  int points = 0;

class Screen{
 BG bg = new BG(255);
 int c, q;
 int next;
 int points;
 float[] position = new float[9];
 color[] col = new color[9]; 
 int[] colorNumber = new int[9];
 
  Screen(){
    for(int i = 0; i < position.length;i++){
     position[i] = 0;
     col[i] = 0;
     colorNumber[i] = 0;
    }
  }
  
  void update(){
    bg.update();
    hover();
    clicked();
    //buttons();
  }
  
  void render(){
   background(0);
   bg.render();
   buttons();
   
   
   
   
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
        next = 1; 
        //counter += 10;
      }
    }
    if(mouseX >= width/8 - 50 && mouseX <= width/8 + 50 && mouseY >= (height/4+60) - 25 && mouseY <= (height/4+60) + 25){
      if(state == 1){
        exit();
      }
    }
    
    for(int i = 0; i < position.length;i++){
      if(mouseX >= (width/4-20)-15 && mouseX <= (width/4-20)+15 && mouseY >= (height/4-10) +position[i]-15 && mouseY <= (height/4-10) +position[i]+15){
       if(state == 1){
        gameMode = i+1; 
        next = 0;
       }
      }
    }
  }
  void buttons(){
    //color
    col[0] = color(255,0,127);
    col[1] = color(255,0,255);
    col[2] = color(0,0,255);
    col[3] = color(0,128,255);
    col[4] = color(0,155,155);
    col[5] = color(0,204,0);
    col[6] = color(204,204,0);
    col[7] = color(255,128,0);
    col[8] = color(255,0,0);
    
    for (int i = 0; i < colorNumber.length; i++){
     colorNumber[i] = 255; 
    }
    
    if(next == 1){
      int p = 0;
      for(int j = 0; j < position.length; j++){
        position[j] = p;
        p += 40;
      }
      fill(120);
      rectMode(CENTER);
      for(int i = 0; i < position.length; i++){
        if(mouseX >= (width/4-20)-15 && mouseX <= (width/4-20)+15 && mouseY >= (height/4-10) +position[i]-15 && mouseY <= (height/4-10) +position[i]+15){
        col[i] = color(255,255,255);
        colorNumber[i] = 0;
     }
     }
    
      
      for(int i = 0; i < position.length; i++){
        fill(col[i]);
        rect(width/4-20, (height/4-10) + position[i], 30, 30, 8);
        
        fill(colorNumber[i]);
        textAlign(CENTER, CENTER);
        textSize(20);
        text(i+1, width/4-20, (height/4-10) + position[i]);
      }
    }
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
}

class Points{
 
  Points(){
    
  }
  
  void update(){
    
  }
  
  void render(){
    pushMatrix();
     fill(120);
     rectMode(CENTER);
     rect(width/8, height/1.18, 150, 50, 10);
   
     textAlign(CENTER, CENTER);
     textSize(20);
     fill(255);
     text("Points "+ points, width/8, height/1.18-5);
    popMatrix();
  }
}