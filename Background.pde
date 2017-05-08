class BG{ 
  Particle[][] dots;    //Creating a two dimensional array of particles for the dots in the background 
  int col;    //used as a variable for the color of the dots
  int cols = height/10;    //Attribute for the collones and rows
  int rows = width/70;

  
  BG(int setColor){    //Constructor with one parameter for the color
    col = setColor;
    dots = new Particle[cols][rows];    //Using the particle constructor to create the array with the sized of the canvas in two different 
    for (int i = 0; i < cols; i++){    //Nested for-loop to create a two dimensional pattern of dots 
      for (int j = 0; j < rows; j++){    //for every collone there is a new row
        //for (int k = 0; k < dots.length; k++){
           dots[i][j] = new Particle(i*47, j*47, 50, col);    //Creating the array with the particle constructor and parameters for the distance between dots, the size and the color
        //}
      }
    }
  }
  
  void update(){    //Method to update the size, using th enested forloop to go through every dot
     for (int i = 0; i < cols; i++)
        for (int j = 0; j < rows; j++){
          //fill(100,0,100);
         dots[i][j].update();
    }
  }
  
  void render(){
    
      for (int i = 0; i < cols; i++)    //The same procedure with the render method
        for (int j = 0; j < rows; j++){
         dots[i][j].render();
      }
    }
}

class Particle{    //Class for the particles
  PVector location;
  float size, r, curSize;
  float t;
  int col;

  
  Particle(float setX,float setY,float setSize, int setColor){     //constructor containing paramters for position, size and color
    col = setColor;
    location = new PVector(setX, setY);    //Creating a vector using the parameter for position
    size = setSize;
  }
  
  void update(){
    t += 0.01;    //In order to generate a random, but smooth flowing change of size, the program uses the Perlin Noise funktion
    r = noise(t);
    curSize = map(r, 0,1,size*0.1,size);    //Since the noise funktion only gives values between 0 and 1, the map function has to be involved
  }
  
  void render(){    //The render method, drawingf the dot at the specific location
    noStroke();
    //stroke(col, 200);
    fill(col, 100);
    rectMode(CENTER);
    ellipse(location.x, location.y, curSize/2, curSize/2);
  }
}