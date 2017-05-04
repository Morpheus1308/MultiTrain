class Bar{
 PVector startPos, endPos;
 float status;
 float statusNumber;
 PFont f;
 
 Bar(){
  startPos = new PVector(width-20, height-20);
  endPos = new PVector(width-20, 20);
 }
 
 void update(){
   status = -map(counter, 0,game.val*50,0, height-20);
   statusNumber = map(counter,0,game.val*50,height-20, 0);
   fill(120);
   text(counter,width-100,status);
   //endPos.sub(startPos);
   //endPos.normalize();
   //endPos.setMag(map(counter, 0,200,0, width-20));
 }
 
 void render(){
   rectMode(CORNER);
   fill(0);
   rect(width-40, height, 30, -height, 10);
   fill(255,0,0);
   rect(width-30, height-20, 10, status);
   
   f = createFont("Arial",16,true);
   textFont(f,25);
   textAlign(CENTER);
   
   fill(0);
   rectMode(CENTER);
   rect(width-50, statusNumber-10, 40, 40, 10);
   fill(255,0,0);
   rect(width-40, statusNumber,40, 2, 10);
   fill(255);
   text(counter,width-50, statusNumber-4);
   //line(startPos.x, startPos.y, endPos.x, endPos.y);
   text(game.val, 20, 20);
   }
 }