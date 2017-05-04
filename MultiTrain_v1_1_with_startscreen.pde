import processing.sound.*;

  SoundFile colSound, winSound;
  Screen start;
  Game game;
  
  int counter;
  int gameMode = 0;
  int state = 0;

void setup(){
  size(1000,500);
  start = new Screen();
  //game = new Game();
  
  colSound = new SoundFile(this, "bubble.WAV");
  winSound = new SoundFile(this, "win.mp3");
  
}

void draw(){
  
  
  if(gameMode == 0){
    start.update();
    start.render();
  } else if (gameMode == 1){
    if(game == null){
    game = new Game(2);
    } else{
      game.update();
      game.render();
      }
 }  
}

void mousePressed(){
  state = 1;
}

void mouseReleased(){
  state = 0; 
}