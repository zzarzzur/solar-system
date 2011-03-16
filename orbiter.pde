

class Orbiter extends TexturedSphere {

  float x,y,z;
  float r = 50;
  float d = 0, orbitdays = 0;
  color c = color(255, 126, 45);
  Orbiter parent;
  float rotationV;
  float rotation=0.0;
  PImage texmap;
  boolean usingTexture = false;
  int runs =0;
  char direction;
  Orbiter() {
  }

  void setTexture(String imageFile) {
    texmap = loadImage( imageFile );    
    usingTexture = true;
    initializeSphere(35);
  }

  void draw() {
    pushMatrix();

    if (parent == null) {
      translate(x, y, z);
    }
    else {
      translate(x + parent.x, y + parent.y, z + parent.z);
    }
    if(rotater == true) runs++;
    if(orbitdays > 0) {
      rotateY(runs / orbitdays);
    }
    if (DRAW_ORBITS) {
      pushMatrix();
      rotateY(PI/2);
      rotateX(PI/2);
      noFill();
      stroke(255);
      ellipse(0,0,d*2,d*2);
      popMatrix();
    }
    //translate distance from parent
    translate (0, 0, d);
    fill(c);
    noStroke();

    if (usingTexture) {
      // draw textured sphere
      if(direction == LEFT || direction == UP) rotation-=rotationV;
      if(direction == RIGHT || direction == DOWN) rotation+=rotationV;
      texturedSphere(r, texmap,rotation,rotationV,direction);
      
      
    } 
    else {
      rotateY(rotation);
      rotation+=rotationV;
      sphere(r);
    }

    popMatrix();
  }

  void draworbit() {
  }
}

