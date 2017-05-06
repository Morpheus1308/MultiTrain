class BG{
  Particle[][] dots;
  int col;

  
  BG(int setColor){
    col = setColor;
    dots = new Particle[height/10][width/40];
    for (int i = 0; i < height/10; i++){
      for (int j = 0; j < width/40; j++){
        //for (int k = 0; k < dots.length; k++){
           dots[i][j] = new Particle(i*30, j*30, 30, col);
        //}
      }
    }
  }
  
  void update(){
     for (int i = 0; i < height/10; i++)
        for (int j = 0; j < width/40; j++){
          //fill(100,0,100);
         dots[i][j].update();
    }
  }
  
  void render(){
    
      for (int i = 0; i < height/10; i++)
        for (int j = 0; j < width/40; j++){
         dots[i][j].render();
      }
    }
}

class Particle{
  PVector location;
  float size, r, curSize;
  float t;
  int col;

  
  Particle(float setX,float setY,float setSize, int setColor){
    col = setColor;
    location = new PVector(setX, setY);
    size = setSize;
  }
  
  void update(){
    t += 0.01;
    r = noise(t);
    curSize = map(r, 0,1,size*0.1,size);
  }
  
  void render(){
    noStroke();
    //stroke(col, 200);
    fill(col, 100);
    rectMode(CENTER);
    ellipse(location.x, location.y, curSize/2, curSize/2);
  }
}