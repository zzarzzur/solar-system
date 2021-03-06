import processing.opengl.*;
import javax.media.opengl.*;

GL gl;
PGraphicsOpenGL pgl;

Orbiter sun, mercury, venus, earth, moon, mars, jupiter, saturn, rings, uranus, neptune, pluto;
boolean DRAW_ORBITS = true;

float rotationX = 0;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;

void setup ()
{
  size(1200,1000, OPENGL);

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

  mercury = new Orbiter();
  mercury.parent = sun;
  mercury.d = 135;
  mercury.orbitdays = 50.1;
  mercury.r = 7;
  mercury.c = color(185);

  venus = new Orbiter();
  venus.parent = sun;
  venus.d = 164;
  venus.orbitdays = 75.1;
  venus.r = 12;
  venus.c = color(85,30,10);

  earth = new Orbiter();
  earth.parent = sun;
  earth.d = 205;
  earth.orbitdays = 365.2;
  earth.r = 13;
  earth.c = color(5, 98, 210);

  mars = new Orbiter();
  mars.parent = sun;
  mars.d = 245;
  mars.orbitdays = 686.9;
  mars.r = 10;
  mars.c = color(250, 8, 0);

  jupiter =  new Orbiter();
  jupiter.setTexture("jupiter.jpg");
  jupiter.parent = sun;
  jupiter.d = 300;
  jupiter.orbitdays = 111.5;
  jupiter.r = 31;
  jupiter.c = color(80, 45, 5);

  saturn =  new Orbiter();
  saturn.parent = sun;
  saturn.d = 370;
  saturn.orbitdays = 120.1;
  saturn.r = 16;
  saturn.c = color(130, 55, 0);

  uranus =  new Orbiter();
  uranus.parent = sun;
  uranus.d = 440;
  uranus.orbitdays = 306.601;
  uranus.r = 17;
  uranus.c = color(10, 100, 200);

  neptune =  new Orbiter();
  neptune.parent = sun;
  neptune.d = 500;
  neptune.orbitdays = 601.521;
  neptune.r = 15;
  neptune.c = color(7, 77, 222);

  pluto =  new Orbiter();
  pluto.parent = sun;
  pluto.d = 555;
  pluto.orbitdays = 555.5;
  pluto.r = 6;
  pluto.c = color(111, 55, 10);
}

void draw()
{
  background(0,0,0);

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
}

/*
 //to find x,y cordinates
 void mousePressed()
 {
 println(mouseX + " " + mouseY);
 }
 */


