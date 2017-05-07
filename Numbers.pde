class Number{    //class for the falling numbers
  PVector location, velocity, acceleration;    //attributes for the different vectors
  float size;
  int n;    //variable for the number
  color c = color(0,0,0);
  boolean col = false;    //boolean indicating if there was a collision between a number and the player
  
  Number(float setX, float setY, int setN, float setSpeedY){    //constructor wit parameters for position, number and velocity
    size = 40;
    location = new PVector(setX,setY);
    velocity = new PVector(0, setSpeedY);
    n = setN;
    //acceleration = new PVector(0, map(n, 0, 50, 0.003, 0.001));
  }
  
  void update(){
    //velocity.add(acceleration);
    location.add(velocity);    //Using the vectorfunction "add" to move the falling number
    collision();    //calling a method to check for collision
  }
  
  void render(){    //rendering the falling number
    //noStroke();
    colorChange();
    fill(c);
    ellipse(location.x,location.y,size,size);
    fill(255);
    textAlign(CENTER);
    textSize(25);
    text(n,location.x,location.y+10); 
  }
  
  void collision(){
    PVector collision = PVector.sub(body.location, location);    //creating new vector by subtracting the position vector of the body from number position vector
    if(collision.x <= body.size-20 && collision.x >= -body.size+20 && collision.y <= body.size-20 && collision.y >= -body.size+20){     //if the ball is in the range of the player
        if(n % game.val == 0){     //when the number fits to the mulitplication table, add the value to the counter and the overall points and set the position back to a random place (has to be changed for the real game) and set the collision boolean to true
        counter += n;
        points += n;
        location.x = random(width);
        location.y = random(-2000,0);
        //velocity.normalize();
        col = true;
        } else{     //If the number does not fit to the table, subtract the value from the counter and the overall points, while setting the position back to a random place
            if(counter > 0){
              counter -= n;
              points -= n;
              location.x = random(width);
              location.y = random(-2000,0);
              //velocity.normalize();
              col = true;
            }
        }
    }
  }
  
  void colorChange(){    //method to define the different colors of the bubbles, referencing to tghe multiplicatio table - each of them has their own color, which makes it easier to play 
   if(n % 9 == 0){
    c = color(255,0,0);    //going down the table, in order to make the highest numbers easier
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