class Screen{
 BG bg = new BG(255);
 
  Screen(){
    
  }
  
  void update(){
    bg.update();
  }
  
  void render(){
   background(0);
   bg.render(); 
   
   fill(125);
   rectMode(CENTER);
   rect(width/2, height/4, 50, 20);
  }
}