import processing.opengl.*;
import javax.media.opengl.*;

GL gl;
PGraphicsOpenGL pgl;

Orbiter sun, mercury, venus, earth, moon, mars, jupiter, saturn, rings, uranus, neptune, pluto;
boolean DRAW_ORBITS = true;
boolean sc = false;
boolean rotater = true;
int f=0;
float rotationX = 0;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;
PImage face;
void setup ()
{
  size(screen.width,screen.height, OPENGL);
  rotationX = 0;
  rotationY = 0;
  velocityX = 0;
  velocityY = 0;  
  // antialiasing
  hint(ENABLE_OPENGL_4X_SMOOTH);
  pgl = (PGraphicsOpenGL) g;
  gl = pgl.gl;
  gl.glHint (gl.GL_LINE_SMOOTH_HINT, gl.GL_NICEST);
  gl.glEnable (gl.GL_LINE_SMOOTH);

  noStroke();

  sun = new Orbiter();
  sun.c = color(255, 130, 40);
  sun.setTexture("sun.jpg");  
  sun.x = 0;
  sun.y = 0;
  sun.rotationV=0.1;

  mercury = new Orbiter();
  mercury.parent = sun;
  mercury.setTexture("mercury.jpg");
  mercury.d = 135;
  mercury.orbitdays = 50.1;
  mercury.r = 7;
  mercury.c = color(185);
  mercury.rotationV=0.15;

  venus = new Orbiter();
  venus.parent = sun;
  venus.setTexture("venus.jpg");
  venus.d = 164;
  venus.orbitdays = 75.1;
  venus.r = 12;
  venus.c = color(85,30,10);
  venus.rotationV=0.15;

  earth = new Orbiter();
  earth.parent = sun;
  earth.setTexture("earth.jpg");
  earth.d = 205;
  earth.orbitdays = 365.2;
  earth.r = 13;
  earth.c = color(5, 98, 210);
  earth.rotationV=0.15;

  mars = new Orbiter();
  mars.parent = sun;
  mars.setTexture("mars.jpg");
  mars.d = 245;
  mars.orbitdays = 686.9;
  mars.r = 10;
  mars.c = color(250, 8, 0);
  mars.rotationV=0.15;

  jupiter =  new Orbiter();
  jupiter.setTexture("jupiter.jpg");
  jupiter.parent = sun;
  jupiter.d = 300;
  jupiter.orbitdays = 111.5;
  jupiter.r = 31;
  jupiter.c = color(80, 45, 5);
  jupiter.rotationV=0.15;

  saturn =  new Orbiter();
  saturn.parent = sun;
  saturn.setTexture("saturn.jpg");
  saturn.d = 370;
  saturn.orbitdays = 120.1;
  saturn.r = 16;
  saturn.c = color(130, 55, 0);
  saturn.rotationV=0.15;

  uranus =  new Orbiter();
  uranus.parent = sun;
  uranus.setTexture("uranus.jpg");
  uranus.d = 440;
  uranus.orbitdays = 306.601;
  uranus.r = 17;
  uranus.c = color(10, 100, 200);
  uranus.rotationV=0.15;

  neptune =  new Orbiter();
  neptune.parent = sun;
  neptune.setTexture("neptune.jpg"); 
  neptune.d = 500;
  neptune.orbitdays = 601.521;
  neptune.r = 15;
  neptune.c = color(7, 77, 222);
  neptune.rotationV=0.15;

  pluto =  new Orbiter();
  pluto.parent = sun;
  pluto.setTexture("pluto.jpg"); 
  pluto.d = 555;
  pluto.orbitdays = 555.5;
  pluto.r = 6;
  pluto.c = color(111, 55, 10);
  pluto.rotationV=0.15;

  textFont(createFont("Ariel",15));
  face = loadImage("face.jpg");
}

void draw()
{

  background(0,0,0);
  if(sc == true) image(face,0,0,width,height);
  //Compass
  pushMatrix();
  noFill();
  stroke(25,255,255);
  ellipse(75,75,75,75);
  text("N", 70+rotationY,15);
  line(75+rotationY,15,75-rotationY,150);
  text("S", 70-rotationY,165);
  text("W", 0,80-rotationY);
  line(15,75-rotationY,150,75+rotationY);
  text("E", 150,80+rotationY);
  popMatrix();
  //Level
  pushMatrix();
  line(200,75+rotationX,275,75+rotationX);
  popMatrix();
  if(rotationY <= -360) rotationY = 0;
  if(rotationY >= 360) rotationY = 0;

  translate(width/2, height/2);

  rotateX( radians(-rotationX) );  
  rotateY( radians(270 - rotationY) );  

  noLights();
  sun.draw();
  lights();
  mercury.draw();
  venus.draw();
  earth.draw();
  mars.draw();
  jupiter.draw();
  saturn.draw();
  uranus.draw();
  neptune.draw();
  pluto.draw();

  // Implements mouse control
  rotationX += velocityX;
  rotationY += velocityY;
  velocityX *= 0.95;
  velocityY *= 0.95;  
  if(mousePressed) {
    velocityX += (mouseY-pmouseY) * 0.01;
    velocityY -= (mouseX-pmouseX) * 0.01;
  }
  if(keyPressed) {

    if(keyCode == UP) sun.x+=10;             //Zoom In
    if(keyCode == DOWN) sun.x-=10;           //Zoom Out
    if(keyCode == LEFT) sun.y+=10;       //Level Up
    if(keyCode == RIGHT) sun.y-=10;        //Level Down
    if(key == 'r') setup();                //Restart
    if(key == 'b') sc = true;                //Restart
  }
}

/*
 //to find x,y cordinates
 void mousePressed()
 {
 println(mouseX + " " + mouseY);
 }
 */
void keyPressed() {
  boolean debounce = false;
  if(key == 's' && rotater == true && debounce == false) { 
    rotater = false; 
    debounce = true;
  } 
  if(key == 's' && rotater == false && debounce == false) { 
    rotater = true; 
    debounce = true;
  }
  if(key == 'd' && DRAW_ORBITS == false && debounce == false) { 
    DRAW_ORBITS = true; 
    debounce = true;
  }
  if(key == 'd' && DRAW_ORBITS == true && debounce == false) { 
    DRAW_ORBITS = false; 
    debounce = true;
  }
  println(rotater);      //Restart
}

