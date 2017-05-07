/*
this part of the code is partially from Daniel Shiffman and his Youtube Channel "Coding Rainbow", where he describes how to make a simple phyllotaxis, what you can change  and so on
link: "https://www.youtube.com/watch?v=KWoJgHFYWxY"

simultaniously I use information about the algorithm from "algorithmicbotany.org" where they describe the different patterns and formulas you have to use in order to get the wished result
link: "http://algorithmicbotany.org/papers/abop/abop-ch4.pdf"

as Daniel describes in his video, we are not able to work from the original formel, since it uses a "polar coordinate system" and we are not able to work with only an angle and a radius, so we have to convert it into x and y positions.
We do that by using the angle and the radius with cosinus and sinus to get the x and y position.
We use a so-called "polar to cartesian coordinate transformation"
*/

public class Phyllotaxis{    //class for the ending animation
  private int n = 0;    //describing the angle every loop, the space between each dot created per loop
  private float deg;    // the degree (preferable 137.5 +-0.4)
  private float angle;    //variable used to convert the angle to radians
  private float c;    //describing the distance from one dot to the next
  private float col;    //variable used for the color
  private float r;    //radius
  
  Phyllotaxis(float setDeg, float setC){
    deg = setDeg;
    c = setC;
    colorMode(HSB);    //changing the colormode to HSB for a more beautiful result
    strokeWeight(0);
    background(255);
  }
  
  void render(){
    pushMatrix();    //saving the current coordinate system to avoid influence on other objects
      angle = deg * PI/180;
      strokeWeight(0.1);

      translate((width/2), height/2);    //changing 0 to the midth of the canvas
      float a = n * angle;    //the angle used to describe the position of the dot
            r = c * sqrt(n);    //the radius
      float x = r * cos(a);    //using cosinus to get the x position
      float y = r * sin(a);    //using sinus to get the y position
      col = r % 256;    //the change of color is influenced by the radius, restarting if the color has reached a value of over 256
      fill(col , 255, 255);    //only changing the hue value
      ellipse(x,y,5,5);
      n += 10;    //the angle per loop
    popMatrix();
  }
  public float getR(){    //getter to let other classes use the r variable
   return r; 
  }
}
  