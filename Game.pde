
  
class Game {
  ArcType body;  //playermodel
  Number[] num;   //array for falling numbers
  Phyllotaxis phyl;    //the phyllotaxis attribute
  BG bg;    //background
  Bar bar;    //scorebar
  Points curScore = new Points(70, 20);    //initializing the scoreboard in the top left
  int val = 0;    //setting the default value of the multiplicatio table to 0;
  long endTime;
  float vel;    //Variable used to define the velocity of the falling numbers - used for the degrees of difficulty
    Game(int setValue, float setVel){     //Constructor wit parameters for multitable and velocity
      vel = setVel;
      val = setValue;
      body = new ArcType(width/2, height-60, 50);    //Initializing the player object
      num = new Number[val * 50];    //initializing the array for the falling numbers with the size of the chosen multitable times 50, e.g. at the table for 1, there will be 50 balls falling down
      bg = new BG(0);      //initializing the background with black dots
      textFont(font,25);
      textAlign(CENTER);
      for (int i = 0; i < num.length; i++){    //for-loop, defining the value of each place in the array to a random number between 0 and the multitablet times 10, while placing it at a random position between the top and minus the multitable times thousand
        int range = int(random(val * 10));
        num[i] = new Number(random(width), random(-val*1000,0), range, vel);
      }  
      bar = new Bar();    //initializing the bar
      endTime = millis()+val*30000; //The time one game lasts - defined as a value of the multitable*30 seconds
    }
  
  void update(){
    bg.update();    //updating the background
    for (int i = 0;i < num.length; i++){    //Updating the position of the numbers
      num[i].update();
    }
    body.update();     //updatin the position of the player 
    bar.update();    //updating the bar
  }
  
  void render(){
    if(counter < val * 50 && endTime > millis()){ //using the bitwise operator in the if statement, so that the game runs until ether the time is up or a specific amount of points has been reached
      background(255);
      bg.render();
      for (int i = 0;i < num.length; i++){    //rendering the falling numbers
      num[i].render();
    }
    body.render();    //rendering the playermodel
    bar.render();    //rendering the bar
    
    for (int i = 0;i < num.length; i++){    //Using the boolean for collision defined in the number class, to play a sound when the playermodel collided with a number
      if(num[i].col == true){
        colSound.play();
        num[i].col = false;
      }
    }
    fill(start.col[val-1]);    //filling the bubble behind the number with a specific color related to the multitable
    rect(130, 20, 30,30, 8);
    fill(255);
    textAlign(CENTER, CENTER);
    text(val, 130, 17);    //visualizing the current multitable/gamemode that is being played
    
    curScore.render();    //rendering the current overall score
    }
    
    
    if(counter >= val * 50){     //Using the control flow statement "if-then" to initialize the ending of the game when a specific amount of points has been reached
      
      
      for (int i = 0;i < num.length; i++){    //placing the numbers out of reach and sight
        num[i].location.x = width+20;
        num[i].location.y = height+20;
      }
      body.location.x = width+100;    //placing the player out of sight
      body.location.y = height+100;
      frameRate(255);    //increasing the framerate in order to gerenate a more effective anf beautiful ending animation
      if (phyl == null){
        phyl = new Phyllotaxis(137.1, 2);     //Initializing the phyllotaxis, if is has not been before
      } else {
        phyl.render();    //rendering the phylloaxis
        }
        
        noStroke();    //The following segment gives the user information about why the game stopped
        rectMode(CENTER);
        fill(100,20 );
        rect(width/2, height/1.18, 700, 130, 8);
        textFont(font);
        textAlign(CENTER, CENTER);
        fill(255);
        text("Congratulations, you reached the highest score", width/2, height/1.2-10);
        text("You reached "+counter+"!", width/2, height/1.2+30);
        
        if(phyl.getR() == 40){    //using the phyllotaxis radius as an indicator for when to play the winning sound
        winSound.play();
        }
      if(phyl.getR() == 220){    //using the phyllotaxis radius as an indicator for when to stop the game and go back to the start screen
        start = null;    //setting every object and vaiable back to null
        game = null;
        phyl = null;
        counter = 0; 
        frameRate(60);
        gameMode = 0;
        colorMode(RGB);    //colorMode
        
      }
    }
    if(endTime <= millis()){    //Using the control flow statement "if-then" to initialize the ending of the game when a specific amount of time has gone - the same ending procedure as with the points
      for (int i = 0;i < num.length; i++){
        num[i].location.x = width+20;
        num[i].location.y = height+20;
      }
      body.location.x = width+100;
      body.location.y = height+100;
      frameRate(255);
      if (phyl == null){
        phyl = new Phyllotaxis(137.3,2);
      } else {
        phyl.render();
        }
      pushMatrix();
        noStroke();
        rectMode(CENTER);
        fill(200,20 );
        rect(width/2, height/1.18, 550, 130, 8);
      popMatrix();
        textFont(font);
        textAlign(CENTER, CENTER);
        fill(255);
        text("Time is up", width/2, height/1.2-10);
        text("You reached "+counter+"!", width/2, height/1.2+30);
        if(phyl.getR() == 40){
         timeIsUp.play(); 
        }

      if(phyl.r >= 240){
        start = null;
        game = null;
        counter = 0;
        frameRate(60);
        phyl = null;
        gameMode = 0;
        colorMode(RGB);
      }
    }
    fill(100,245);    //The following segment is the cancel button in the bottom left corner
    rect(width-width+30, height-20, 70, 30);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(15);
    text("Cancel", width-width+30, height-20);
    if(mouseX >= (width-width+30)-35 && mouseX <=  (width-width+20)+35 && mouseY >= (height-20)-15 && mouseY <= (height-20)+15){    //when button pressed, end the game and go back to start screen
      if(state == 1){
        start = null;
        game = null;
        counter = 0;
        frameRate(60);
        phyl = null;
        gameMode = 0;
        colorMode(RGB);
      }
    }
  }
}