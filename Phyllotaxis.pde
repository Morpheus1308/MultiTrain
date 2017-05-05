class Phyllotaxis{
  int n = 0;
  float deg;
  float angle;
  float c;
  float col;
  float r;
  
  Phyllotaxis(float setDeg, float setC){
    deg = setDeg;
    c = setC;
    colorMode(HSB);
    strokeWeight(0);
    background(255);
  }
  
  void render(){
      angle = deg * PI/180;
      strokeWeight(0.1);

      translate((width/2), height/2);
      float a = n * angle;
            r = c * sqrt(n);
      float x = r * cos(a);
      float y = r * sin(a);
      col = r % 256;
      fill(col , 255, 255);
      ellipse(x,y,5,5);
      n += 10;
      
  }
  }
  