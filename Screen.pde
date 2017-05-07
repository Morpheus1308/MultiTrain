  int points = 0;

class Screen{     //class for the start screen
 BG bg = new BG(255);     //initializing the backgounddots with the color white
 color c, q, w, a, s, d, colDir;    //diffent variables used to change th ecolor of the buttons
 boolean ama = true, med = false, adv = false;     //booleans describing the difficulty
 int next;    //variable used to go from pressing start to choosing difficulty and table
 float[] position = new float[9];    //Array used to store the position of the nine different buttons for the multiplication tables
 color[] col = new color[9];     //array to store the color of the nine buttons, related to the number
 int[] colorNumber = new int[9];    //array for chaning color of the nine buttons
 float rotation = 0;    //variable used for the rotation of the icon/multiplication icon
 float rotFac = 0, rotFacNeg = 0;    //variables to store the rotation factors
 boolean dir = false;    //boolean for the direction of the rotation
 About about;     //the about segment attribut
 
  Screen(){
    for(int i = 0; i < position.length;i++){    //resetting every spot in the three arrays back to 0, to avoid flaws in the game
     position[i] = 0;
     col[i] = 0;
     colorNumber[i] = 0;
    }
    about = new About();    //initializing the about segment
  }
  
  void update(){
    bg.update();    //updating the changing size of the dots in the background
    hover();    //checking if the mouse is above some of the buttons
    clicked();    //checking if a button has been clicked
     
  }
  
  void render(){
   background(50);     //chaning the background color, in order to make the dots visible
   bg.render();    //rendering the dots
   buttons();
   pushMatrix();    //saving the current coordinate system
   translate(width/1.32, height/2);    //changing the coordinate system, in order to beeing able to scale the big icon (in the render method in order to avoid manipulating the other uses of the icon
   scale(map(mouseY, 0, width, 1, 1.5));    //the scale depends on the mouse Y position
   icon(0, 0, 300, 200, 8);     //initializing the icon with different arguments - position, size of the circle, size of the cross and the stroke
   popMatrix();     //restoring the previous coordinate system
   difficulty();     //rendering the difficulty buttons
   
  }
  
  void hover(){    //Method to check if the mouse is on some of the buttons
    if(mouseX >= width/8 - 75 && mouseX <= width/8 + 75 && mouseY >= height/4 - 25 && mouseY <= height/4 + 25){    //The start button
     c = 200; 
    } else {
      c = 100;
    }
    
    if(mouseX >= width/8 - 75 && mouseX <= width/8 + 75 && mouseY >= (height/4+60) - 25 && mouseY <= (height/4+60) + 25){    //the cancel button
     q = 200; 
    } else {
      q = 100;
    }
    
    if(mouseX >= width/8 - 75 && mouseX <= width/8 + 75 && mouseY >= (height/4+120) - 25 && mouseY <= (height/4+120) + 25){    //the about button
     w = 200; 
    } else {
      w = 100;
    }
    
    if(mouseX >= width/2 && mouseX <= width && mouseY >= 0 - 25 && mouseY <= height){    //the little text in the bottom right corner, indicating that one has to hold the mousebutton to change direction
     colDir = 255; 
    } else {
     colDir = 175;
    }
  }
  
  void clicked(){    //method to check if a button has been clicked
    if(mouseX >= width/8 - 50 && mouseX <= width/8 + 50 && mouseY >= height/4 - 25 && mouseY <= height/4 + 25){    //if the start button has been clicked, go to the next step and show dificulty and table
      if(state == 1){
        next = 1; 
        //counter += 10;
      }
    }
    if(mouseX >= width/8 - 50 && mouseX <= width/8 + 50 && mouseY >= (height/4+60) - 25 && mouseY <= (height/4+60) + 25){    //if the cancel button has been pressed, stop the program
      if(state == 1){
        exit();
      }
    }
    
    
    
    for(int i = 0; i < position.length;i++){    //check if one of the mulitplicationtable buttons have been clicked
      if(mouseX >= (width/4-20)-15 && mouseX <= (width/4-20)+15 && mouseY >= (height/4-10) +position[i]-15 && mouseY <= (height/4-10) +position[i]+15){
       if(state == 1){    //if one has been clicked, check which and set gamemode the the clicked value
        gameMode = i+1; 
        next = 0;
       }
      }
    }
    if(state == 1){    //checking if the mouse is beeing clicked - if yes, change direction
       if(dir == false){
          dir = true;
       } else{
         dir = false;
       }
     }
     if(mouseX >= width/8 - 50 && mouseX <= width/8 + 50 && mouseY >= (height/4+120) - 25 && mouseY <= (height/4+120) + 25){    //check if the "about" button has been clicked
      if(state == 1){
        next = 2;
        //counter += 10;
      }
    }
  }
  void buttons(){     //method describing the different buttons
    //color
    col[0] = color(255,0,127);    //defining the value of different positions in the color array
    col[1] = color(255,0,255);
    col[2] = color(0,0,255);
    col[3] = color(0,128,255);
    col[4] = color(0,155,155);
    col[5] = color(0,204,0);
    col[6] = color(204,204,0);
    col[7] = color(255,128,0);
    col[8] = color(255,0,0);
    
    for (int i = 0; i < colorNumber.length; i++){    //setting the color of the numbers to white
     colorNumber[i] = 255; 
    }
    
    if(next == 1){    //hvis der blev trykket på start
      int p = 0;
      for(int j = 0; j < position.length; j++){    //defining the position of the texts Y position
        position[j] = p;
        p += 40;
      }
      fill(120);
      rectMode(CENTER);
      for(int i = 0; i < position.length; i++){    //Checking if the mouse is on one of the buttons, if yes change the backgroundcolor to white and the text color to white
        if(mouseX >= (width/4-20)-15 && mouseX <= (width/4-20)+15 && mouseY >= (height/4-10) +position[i]-15 && mouseY <= (height/4-10) +position[i]+15){
        col[i] = color(255,255,255);
        colorNumber[i] = 0;
     }
     }
    
      
      for(int i = 0; i < position.length; i++){    //Creating the buttons and the numbers at the specific position and with the specific color
        fill(col[i]);
        rect(width/4-20, (height/4-10) + position[i], 30, 30, 8);
        
        fill(colorNumber[i]);
        textAlign(CENTER, CENTER);
        textSize(20);
        text(i+1, width/4-20, (height/4-10) + position[i]);
      }
    }
     
     fill(100);
     rectMode(CORNER);
     rect(112, 50, 790, 80, 8);
     
     fill(255);
     textAlign(LEFT);
     textSize(40);
     text("MultiTrain", 125, 90);
     textSize(20);
     text("Have fun while learning the multiplication table!", 125, 110);
     
    //the start button
     strokeWeight(1);
     fill(c);
     stroke(255);
     rectMode(CENTER);
     rect(width/8, height/4, 150, 50, 10);    
   
     textAlign(CENTER, CENTER);
     textSize(32);
     fill(255-c+50);
     text("Start", width/8, height/4-5);    //the start text
     
     //the cancel button
     stroke(255);
     fill(q);
     rect(width/8, height/4 + 60, 150, 50, 10);    
   
     fill(255-q+50);
     text("Cancel", width/8, height/4+55);    //the cancel text
     
     //the about button
     stroke(255);
     fill(w);
     rect(width/8, height/4 + 120, 150, 50, 10);    
     
     //Instructions manual
     fill(100, 240);
     rect(width/2-100, height/3, 500, 170, 8);
     
     fill(255);
     textAlign(LEFT);
     textSize(40);
     text("Instructions", width/3-80, height/3-40);
     textSize(20);
     fill(220);
     text("1. Read the rules!", width/3-80, height/3-5);
     text("2. Press Start.", width/3-80, height/3+20);
     text("3. Choose the degree of difficulty.",  width/3-80, height/3+45);
     text("4. Choose the multiplication table you want to learn.",  width/3-80, height/3+70);
     
     //about button
     textSize(32);
     textAlign(CENTER, CENTER);
     fill(255-w+50);
     text("Rules", width/8, height/4+115);    //the about text
     
      //the text in the bottom right corner
     fill(colDir);
     textSize(20);
     text("(Hold to change direction)", width-120, height-10);
     
     
     
     if(next == 2){    //checking if the about button has been pressed - if yes, render and update the about page
      about.render();
      about.update();
    }
  }
  void icon(float setPosX, float setPosY, float setSizeCircle, float setSizeCross, float setStroke ){    //the method defining the icon, used big on the start page and little at the overall counter
    float posX = setPosX;
    float posY = setPosY;
    float CSize = setSizeCircle;    //attribute for the circle size
    float KSize = setSizeCross;    //attribute for the cross size
    float stroke = setStroke;

   pushMatrix();    //Saving the current coordinate system
   translate(posX, posY);    //using the translate transformation to set the coordinates x0 and y0 to a specific position and thereby making it possible to rotate the icon around it self
     fill(20,200);
     stroke(255);
     strokeWeight(stroke);
     ellipse(0, 0, CSize,CSize);
 
     //if(dir == true){
       if(state == 1){    //If the mouse is beeing pressed
       if(rotFacNeg <= 0){    //check if the rotation to the opposite direction is at zero - if not, reduce it step by step, until it is and it is able to rotate to the wished direction
         rotFac += 0.0005;    //accelerating the rotation with 0.005 per frame
         rotation += rotFac;
         if (rotFac >=0.04){    //stopping the acceleration and holding the velocity at 0.04 per frame
           rotFac = 0.04; 
         }
       }else{
         rotFacNeg -= 0.0005;     //deccelerating by 0.0005 per frame
         rotation -= rotFacNeg;
        }
     } 
     //if(dir == false){
       if(state == 0){    //If the mouse is not pressed
       if(rotFac <= 0){    //same procedure as the former one
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
     rotate(rotation);    //the actual rotating process
     rect(0, 0, map(mouseX, 0, width, KSize*0.8, KSize*1.2), map(mouseX, 0, width, KSize*0.1, KSize*0.12), 8);    //mapping the size to the mouse postion
     rect(0, 0,map(mouseX, 0, width, KSize*0.1, KSize*0.12), map(mouseX, 0, width, KSize*0.8, KSize*1.2), 8);
   
   popMatrix();    //restoring the former coordinatesystem
   
  }
  void difficulty(){    //method to change the difficulty
    if(next == 1){    //ckecking if start has been pressed
      if(mouseX >= (width/3 - 20) - 75 && mouseX <= (width/3 - 20) + 75 && mouseY >= (height/4 + 190) - 15 && mouseY <= (height/4 + 190) + 15){    //If the mouse is on one of the buttons, change the color of the button
        a = 150; 
      } else {
        a = 70;
      }
      if(mouseX >= (width/3 - 20) - 75 && mouseX <= (width/3 - 20) + 75 && mouseY >= (height/4 + 250) - 15 && mouseY <= (height/4 + 250) + 15){
        s = 150; 
      } else {
        s = 70;
      }
      if(mouseX >= (width/3 - 20) - 75 && mouseX <= (width/3 - 20) + 75 && mouseY >= (height/4 + 310) - 15 && mouseY <= (height/4 + 310) + 15){
        d = 150; 
      } else {
        d = 70;
      }
      
      if(mouseX >= (width/3 - 20) - 75 && mouseX <= (width/3 - 20) + 75 && mouseY >= (height/4 + 190) - 15 && mouseY <= (height/4 + 190) + 15){    //If on eof the buttons has been pressed, change the booleans of the difficulty to fit the current selection
        if(state == 1){
          ama = true;
          med = false;
          adv = false;
          
        }
      }
      if(mouseX >= (width/3 - 20) - 75 && mouseX <= (width/3 - 20) + 75 && mouseY >= (height/4 + 250) - 15 && mouseY <= (height/4 + 250) + 15){
        if(state == 1){
          ama = false;
          med = true;
          adv = false;
        }
      }
      if(mouseX >= (width/3 - 20) - 75 && mouseX <= (width/3 - 20) + 75 && mouseY >= (height/4 + 310) - 15 && mouseY <= (height/4 + 310) + 15){
        if(state == 1){
          ama = false;
          med = false;
          adv = true;
        }
      }
      if(ama == true){    //check which difficulty is currently choosen, set the difficultz to the chosen one
        a = color(0,204, 0);
        dif = 1;
      }
      if(med == true){
        s = color(204, 204, 0);
        dif = 2;
      }
      if(adv == true){
        d = color(255, 0, 0);
        dif = 3;
      }
      noStroke();
      fill(a);
      rect(width/3 - 20, height/4 + 190, 150, 30, 6);
      fill(255);
      text("Amateur", width/3 - 20, height/4 + 187);    //the visual button of the amateur button
      
      fill(s);
      rect(width/3 - 20, height/4 + 250, 150, 30, 6);
      fill(255);
      text("Medium", width/3 - 20, height/4 + 247);    //the visual button of the medium button
      
      fill(d);
      rect(width/3 - 20, height/4 + 310, 150, 30, 6);
      fill(255);
      text("Advanced", width/3 - 20, height/4 + 307);    //the visual button of the advanced button
    }
  }
}

class Points{    //class used to store and visualize the overall points
 float posX, posY;
  Points(float setPosX, float setPosY){    //constructor with the position of the points display
    posX = setPosX;
    posY = setPosY;
  }
  
  void update(){
    
  }
  
  void render(){
      textFont(font);
      strokeWeight(2);
     fill(120);
     rectMode(CENTER);
     rect(posX, posY, 60, 30, 10);    //The background
   
     textAlign(CENTER, CENTER);
     textSize(25);
     fill(255);
     text( points, posX, posY-4);    //the text
     
     start.icon(posX-50, posY,30,20, 2);    //the icon
  }
}