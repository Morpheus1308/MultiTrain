/*
Name:      Bende Siewertsen
Program:   MultiTrain
Purpose:   Teaching young children the multiplication table
           
           Created for the examination for the subject "Programmering på C-niveau"

Resources used  in the project:
            Ressource used to find ther right terminology for the commentary
                  "http://www.oracle.com/technetwork/java/glossary-135216.html"
Special thanks to..
            ..my teacher Kasper Kristensen, for helping me with the background, including the idea with the double array!
            ..to Daniel Shiffman and his Youtube Channel "Coding Rainbow" for further eduaction in matters of using Arrays and Vectors - Furthermore for his video about Phyllotaxis!
*/
import processing.sound.*;    //Importing a sound Library, in order to use the soundfiles

  SoundFile colSound, winSound, timeIsUp;   //Soundfiles, used later in the program
  Screen start;   //variable declaration - start Screen
  Game game;   // the Game
  Points score;    //handles the overall score
  
  int counter;   //Used to count points in the game - e.g. used to end the game after a specifik amount of points
  int gameMode = 0;   //Variable used to get from one screen to the next
  int state = 0; //vaiable used to indicate mousepressing
  PFont font;   // variabel to define the font
  float dif;   //used to adjust the dificulty


void setup(){   //initiation of the first block of code, only running once
  size(1500, 750);   //defining the size of the canvas
  score = new Points(width/7, height/1.18);   //Using the Points constructor with two arguments, to initialize the points object 
  font = createFont("Arciform.otf", 32);   //defining the font 
  dif = 1;   // setting the difficultz to 1 - which means amateur
  
  colSound = new SoundFile(this, "bubble.WAV");  //Using the imported sound library to initialize and define the sound
  winSound = new SoundFile(this, "winning.WAV");
  timeIsUp = new SoundFile(this, "timeisup.WAV");
}

void draw(){  //Processing specific funktion, running as a loop
  
  switch(gameMode){  //Using the Switch case, in order to differentiate bewteen the screens and game modes
   case 0:  //defining a group of statements to be executed if a specified value matches the value defined by a preceding "switch" keyword.
   if(start == null){    //In order to restart the screen with full functionality, I use the null type in the Screen class. 
     start = new Screen(); //initializing the Screen object if there is none
   } else{
    start.update();    //if there already is an object, update and render
    start.render();
   }
    score.render();    //rendering the overall score
    break;
   case 1:
    if(game == null){    //The next nine cases define a group of statements to run the game with gamemode variable used to differentiate between the multiplication tables
      game = new Game(1, dif);
      } else{
        game.update();
        game.render();
        }
      break;
   case 2:
     if(game == null){
      game = new Game(2, dif);
      } else{
        game.update();
        game.render();
        }
        break;
    case 3:
     if(game == null){
      game = new Game(3, dif);
      } else{
        game.update();
        game.render();
        }
        break;
    case 4:
     if(game == null){
      game = new Game(4, dif);
      } else{
        game.update();
        game.render();
        }
        break;
    case 5:
     if(game == null){
      game = new Game(5, dif);
      } else{
        game.update();
        game.render();
        }
        break;
    case 6:
     if(game == null){
      game = new Game(6, dif);
      } else{
        game.update();
        game.render();
        }
        break;
    case 7:
     if(game == null){
      game = new Game(7, dif);
      } else{
        game.update();
        game.render();
        }
        break;
    case 8:
     if(game == null){
      game = new Game(8, dif);
      } else{
        game.update();
        game.render();
        }
        break;
    case 9:
     if(game == null){
      game = new Game(9, dif);
      } else{
        game.update();
        game.render();
        }
        break;
  }
}

void mousePressed(){    //Method used to check if the mouse is pressed
  state = 1;    //Variable used in different other classes
}

void mouseReleased(){
  state = 0; 
}