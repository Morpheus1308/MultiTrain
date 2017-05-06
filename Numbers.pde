import processing.sound.*;

class Number{
  PVector location, velocity, acceleration;
  float size;
  int n;
  color c = color(0,0,0);
  boolean col = false;
  
  Number(float setX, float setY, int setN, float setSpeedY){
    size = 40;
    location = new PVector(setX,setY);
    velocity = new PVector(0, setSpeedY);
    n = setN;
    //acceleration = new PVector(0, map(n, 0, 50, 0.003, 0.001));
  }
  
  void update(){
    //velocity.add(acceleration);
    location.add(velocity);
    colision();
  }
  
  void render(){
    //noStroke();
    colorChange();
    fill(c);
    ellipse(location.x,location.y,size,size);
    fill(255);
    textAlign(CENTER);
    text(n,location.x,location.y+10); 
  }
  
  void colision(){
    PVector colision = PVector.sub(body.location, location);
    if(colision.x <= body.size-20 && colision.x >= -body.size+20 && colision.y <= body.size-20 && colision.y >= -body.size+20){
        if(n % game.val == 0){
        counter += n;
        location.x = random(width);
        location.y = random(-2000,0);
        velocity.normalize();
        col = true;
        } else{
            if(counter > 0){
              counter -= n;
              location.x = random(width);
              location.y = random(-2000,0);
              velocity.normalize();
              col = true;
            }
        }
    }
  }
  
  void colorChange(){
   if(n % 9 == 0){
    c = color(255,0,0);
   }else
     if(n % 8 == 0){
      c = color(255,128,0);
     }else
       if(n % 7 == 0){
        c = color(204,204,0);
       }else
         if(n % 6 == 0){
          c = color(0,204,0);
         }else
           if(n % 5 == 0){
            c = color(0,155,155);
           }else
             if(n % 4 == 0){
            c = color(0,128,255);
             }else
               if(n % 3 == 0){
                c = color(0,0,255);
               }else
                 if(n % 2 == 0){
                  c = color(255,0,255);
                 } else 
                     if(n % 1 == 0){
                       c = color(255,0,127);
                     }
   }
  }