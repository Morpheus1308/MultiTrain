import processing.sound.*;

  SoundFile colSound, winSound, timeIsUp;
  Screen start;
  Game game;
  Points score;
  
  int counter;
  int gameMode = 0;
  int state = 0;
  PFont font;


void setup(){
  size(1000,500);
  score = new Points(width/7, height/1.18);
  font = createFont("Arciform.otf", 32);
  
  colSound = new SoundFile(this, "bubble.WAV");
  winSound = new SoundFile(this, "win.mp3");
  timeIsUp = new SoundFile(this, "timeisup.WAV");
}

void draw(){
  
  switch(gameMode){
   case 0:
   if(start == null){
     start = new Screen();
   } else{
    start.update();
    start.render();
   }
    score.render();
    break;
   case 1:
    if(game == null){
      game = new Game(1);
      } else{
        game.update();
        game.render();
        }
      break;
   case 2:
     if(game == null){
      game = new Game(2);
      } else{
        game.update();
        game.render();
        }
        break;
    case 3:
     if(game == null){
      game = new Game(3);
      } else{
        game.update();
        game.render();
        }
        break;
    case 4:
     if(game == null){
      game = new Game(4);
      } else{
        game.update();
        game.render();
        }
        break;
    case 5:
     if(game == null){
      game = new Game(5);
      } else{
        game.update();
        game.render();
        }
        break;
    case 6:
     if(game == null){
      game = new Game(6);
      } else{
        game.update();
        game.render();
        }
        break;
    case 7:
     if(game == null){
      game = new Game(7);
      } else{
        game.update();
        game.render();
        }
        break;
    case 8:
     if(game == null){
      game = new Game(8);
      } else{
        game.update();
        game.render();
        }
        break;
    case 9:
     if(game == null){
      game = new Game(9);
      } else{
        game.update();
        game.render();
        }
        break;
  }
}

void mousePressed(){
  state = 1;
}

void mouseReleased(){
  state = 0; 
}