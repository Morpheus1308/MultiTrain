  int points = 0;

class Screen{
 BG bg = new BG(255);
 int c, q, colDir;
 int next;
 int points;
 float[] position = new float[9];
 color[] col = new color[9]; 
 int[] colorNumber = new int[9];
 float rotation = 0;
 float rotFac = 0, rotFacNeg = 0;
 boolean dir = false;
 
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
   pushMatrix();
   translate(width/1.5, height/2);
   scale(map(mouseY, 0, width, 1, 2));
   icon(0, 0, 300, 200, 8);
   popMatrix();
   
   
  }
  
  void hover(){
    if(mouseX >= width/8 - 75 && mouseX <= width/8 + 75 && mouseY >= height/4 - 25 && mouseY <= height/4 + 25){
     c = 200; 
    } else {
      c = 100;
    }
    
    if(mouseX >= width/8 - 75 && mouseX <= width/8 + 75 && mouseY >= (height/4+60) - 25 && mouseY <= (height/4+60) + 25){
     q = 200; 
    } else {
      q = 100;
    }
    
    if(mouseX >= width/2 && mouseX <= width && mouseY >= 0 - 25 && mouseY <= height){
     colDir = 255; 
    } else {
     colDir = 175;
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
    if(state == 1){
       if(dir == false){
          dir = true;
       } else{
         dir = false;
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
     stroke(255);
     rectMode(CENTER);
     rect(width/8, height/4, 150, 50, 10);
   
     textAlign(CENTER, CENTER);
     textSize(32);
     fill(255);
     text("Start", width/8, height/4-5);
     
     stroke(255);
     fill(q, 0, 0);
     rect(width/8, height/4 + 60, 150, 50, 10);
   
     fill(255);
     text("Cancel", width/8, height/4+55);
     
     fill(colDir);
     textSize(20);
     text("(Hold to change direction)", width-120, height-10);
  }
  void icon(float setPosX, float setPosY, float setSizeCircle, float setSizeCross, float setStroke ){
    float posX = setPosX;
    float posY = setPosY;
    float CSize = setSizeCircle;
    float KSize = setSizeCross;
    float stroke = setStroke;

   pushMatrix();
   translate(posX, posY);
     fill(20,200);
     stroke(255);
     strokeWeight(stroke);
     ellipse(0, 0, CSize,CSize);
 
     //if(dir == true){
       if(state == 1){
       if(rotFacNeg <= 0){
         rotFac += 0.0005;
         rotation += rotFac;
         if (rotFac >=0.04){
           rotFac = 0.04; 
         }
       }else{
         rotFacNeg -= 0.0005;
         rotation -= rotFacNeg;
        }
     } 
     //if(dir == false){
       if(state == 0){
       if(rotFac <= 0){
         rotFacNeg += 0.0005;
         rotation -= rotFacNeg;
         if (rotFacNeg >=0.04){
           rotFacNeg = 0.04; 
         }
       }else{
         rotFac -= 0.0005;
         rotation += rotFac;
        }
     }
     fill(255);
     rotate(rotation);
     rect(0, 0, map(mouseX, 0, width, KSize*0.8, KSize*1.2), map(mouseX, 0, width, KSize*0.1, KSize*0.12), 8);
     rect(0, 0,map(mouseX, 0, width, KSize*0.1, KSize*0.12), map(mouseX, 0, width, KSize*0.8, KSize*1.2), 8);
   
   popMatrix();
   
  }
}

class Points{
 float posX, posY;
  Points(float setPosX, float setPosY){
    posX = setPosX;
    posY = setPosY;
  }
  
  void update(){
    
  }
  
  void render(){
    pushMatrix();
      textFont(font);
      strokeWeight(2);
     fill(120);
     rectMode(CENTER);
     rect(posX, posY, 60, 30, 10);
   
     textAlign(CENTER, CENTER);
     textSize(25);
     fill(255);
     text( points, posX, posY-4);
     
     start.icon(posX-50, posY,30,20, 2);
    popMatrix();
  }
}