  Number[] num;
  PFont f;
  Player body;
  Bar bar;
  Phyllotaxis phyl;
  BG bg;
class Game {
  Points curScore = new Points(70, 20);
  int val = 0;
  long endTime;
  float vel;
    Game(int setValue, float setVel){
      vel = setVel;
      val = setValue;
      body = new Player(width/2, height-60);
      num = new Number[val * 50];
      bg = new BG(0);
      f = createFont("Arial",16,true);
      textFont(f,25);
      textAlign(CENTER);
      for (int i = 0; i < num.length; i++){
        int range = int(random(val * 10));
        num[i] = new Number(random(width), random(-val*1000,0), range, vel);
      }  
      bar = new Bar();
      endTime = millis()+val*30000; //Tiden der går indtil spillet slutter
    }
  
  void update(){
    bg.update();
    for (int i = 0;i < num.length; i++){
      num[i].update();
    }
    body.update();
    bar.update();
  }
  
  void render(){
    if(counter < val * 50 && endTime > millis()){
      background(255);
      bg.render();
      for (int i = 0;i < num.length; i++){
      num[i].render();
    }
    body.render();
    bar.render();
    
    for (int i = 0;i < num.length; i++){
      if(num[i].col == true){
        colSound.play();
        num[i].col = false;
      }
    }
    fill(start.col[val-1]);
    rect(130, 20, 30,30, 8);
    fill(255);
    textAlign(CENTER, CENTER);
    text(val, 130, 17);
    
    curScore.render();
    }
    
    
    if(counter >= val * 50){
      
      
      for (int i = 0;i < num.length; i++){
        num[i].location.x = width+20;
        num[i].location.y = height+20;
      }
      body.location.x = width+100;
      body.location.y = height+100;
      frameRate(255);
      if (phyl == null){
        phyl = new Phyllotaxis(137.3, 2);
      } else {
        phyl.render();
        }
        
      pushMatrix();
        noStroke();
        rectMode(CENTER);
        fill(200,20 );
        rect(width/2, height/1.18, 700, 130, 8);
      popMatrix();
        textFont(font);
        textAlign(CENTER, CENTER);
        fill(255);
        text("Congratulations, you reached the highest score", width/2, height/1.2-10);
        text("You reached "+counter+"!", width/2, height/1.2+30);
        if(phyl.r == 40){
        winSound.play();
        }
      if(phyl.r == 220){
        start = null;
        game = null;
        phyl = null;
        counter = 0;
        frameRate(60);
        gameMode = 0;
        colorMode(RGB); // en halv dags arbejde spildt pga. underlige farver efter det foerste spil -.-
        
      }
    }
    if(endTime <= millis()){
      for (int i = 0;i < num.length; i++){
        num[i].location.x = width+20;
        num[i].location.y = height+20;
      }
      body.location.x = width+100;
      body.location.y = height+100;
      frameRate(255);
      if (phyl == null){
        phyl = new Phyllotaxis(137.1,2);
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
        if(phyl.r == 40){
         timeIsUp.play(); 
        }

      if(phyl.r >= 240){
        start = null;
        game = null;
        counter = 0;
        frameRate(60);
        phyl = null;
        gameMode = 0;
        colorMode(RGB); // en halv dags arbejde spildt pga. underlige farver efter det foerste spil -.-
      }
    }
    fill(100,245);
    rect(width-width+30, height-20, 70, 30);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(15);
    text("Cancel", width-width+30, height-20);
    if(mouseX >= (width-width+30)-35 && mouseX <=  (width-width+20)+35 && mouseY >= (height-20)-15 && mouseY <= (height-20)+15){
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