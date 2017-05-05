  Number[] num;
  PFont f;
  Player body;
  Bar bar;
  Phyllotaxis phyl;
  BG bg;
class Game {
  int val = 0;
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
    if(counter < val * 50){
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
        phyl = new Phyllotaxis(137.8, 2);
      } else {
        phyl.render();
        }  
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
  }
}