  Number[] num;
  PFont f;
  Player body;
  Bar bar;
  Phyllotaxis phyl;
  BG bg;
class Game {
  int val = 0;
  long endTime;
    Game(int setValue){
      val = setValue;
      body = new Player(width/2, height-60);
      num = new Number[val * 10];
      bg = new BG(0);
      f = createFont("Arial",16,true);
      textFont(f,25);
      textAlign(CENTER);
      for (int i = 0; i < num.length; i++){
        int range = int(random(val * 10));
        num[i] = new Number(random(width), random(-2000,0), range, 1);
      }  
      bar = new Bar();
      endTime = millis()+60000; //Tiden der går indtil spillet slutter
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
    }
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
    rect(20, 20, 30,30, 8);
    fill(255);
    textAlign(CENTER, CENTER);
    text(val, 20, 17);
    
    if(counter >= val * 50){
      //winSound.play();
      
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
      if(phyl.r == 220){
        points += counter;
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

      if(phyl.r >= 240){
        points += counter;
        start = null;
        game = null;
        counter = 0;
        frameRate(60);
        phyl = null;
        
          gameMode = 0;

          colorMode(RGB); // en halv dags arbejde spildt pga. underlige farver efter det foerste spil -.-
      }
    }
  }
}