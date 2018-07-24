class Bar{    //The class for the status bar, visualizing the status and the current points in the game
 PVector startPos, endPos;    //defining start and end position of the bar
 float status;    //variable for the current status, used for the 
 float statusNumber;    //variable for position of the number
 
 Bar(){
  startPos = new PVector(width-20, height-20);    //Using vectors to define the start and end position
  endPos = new PVector(width-20, 20);
 }
 
 void update(){
   status = -map(counter, 0,game.val*50,0, height-20);    //Map funktion so that the bar uses the height to show the status without overflowing with any multiplication table
   statusNumber = map(counter,0,game.val*50,height-20, 0);    //the same with the number status, but vice versa, since the status needs height and the number a position
   //endPos.sub(startPos); //started the bar by using vector functions, but it did not work as well as the other solution
   //endPos.normalize();
   //endPos.setMag(map(counter, 0,200,0, width-20));
 }
 
 void render(){
   noStroke();
   rectMode(CORNER);
   fill(100);
   rect(width-40, height, 30, -height, 10);    //The black bar
   fill(255,0,0);
   rect(width-30, height-20, 10, status);    //The red bar
   
   textFont(font,25);
   textAlign(CENTER);
   
   fill(100);
   rectMode(CENTER);
   rect(width-50, statusNumber-10, 40, 40, 10);    //number background
   fill(255,0,0);
   rect(width-40, statusNumber,40, 2, 10);    //line under the number
   fill(255);
   text(counter,width-50, statusNumber-4);    //The number
   //line(startPos.x, startPos.y, endPos.x, endPos.y);
   }
 }