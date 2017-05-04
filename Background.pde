class BG{
  Particle[][] dots;
  int c;
  
  BG(int setColor){
    c = setColor;
    dots = new Particle[height/10][width/40];
    for (int i = 0; i < height/10; i++){
      for (int j = 0; j < width/40; j++){
        //for (int k = 0; k < dots.length; k++){
           dots[i][j] = new Particle(i*30, j*30, 2, c);
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
  float size, r;
  float t;
  int c;
  
  Particle(float setX,float setY,float setSize, int setColor){
    c = setColor;
    location = new PVector(setX, setY);
    size = setSize;
  }
  
  void update(){
    t += 0.01;
    r = noise(t);
    size = map(r, 0,1,1,30);
  }
  
  void render(){
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(location.x, location.y, size/2, size/2);
  }
}