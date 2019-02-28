float cameraRotationAngle;
PShape plane, tower;
PImage bunkerTexture, groundTexture, planeTexture;

void setup() {
  size(800, 800, P3D);
  noStroke();
  cameraRotationAngle = 0;
  bunkerTexture = loadImage("./data/tankTexture.png");
  groundTexture = loadImage("./data/ground.jpg");
  plane = loadShape("./data/plane.obj");
  planeTexture = loadImage("./data/planeTexture.jpg");
  plane.setTexture(planeTexture);
  tower = loadShape("./data/tower.obj");
}

void draw() {
  background(200, 200, 200);
  
  updateCameraCoordinates();
  
  lights();
  directionalLight(255, 255, 255, width/2, height/2, (height/2.0) / tan(PI*30.0 / 180.0));
  
  pushStyle();
  pushMatrix();
  translate(200, -200, 0);
  box(600, 100, 1);
  fill(10, 10, 10);
  text("To rotate the camera right/left press -> d/a", -230,-15, 2);
  text("To move the camera target, use the mouse pointer", -230, 15, 2);
  rotateY(PI);
  text("To rotate the camera right/left press -> d/a", -230,-15, 2);
  text("To move the camera target, use the mouse pointer", -230, 15, 2);
  popMatrix();
  popStyle();
  
  specular(65, 97, 2); 
  shininess(1);
  texturedCube(groundTexture, 500, 10, 500);
  
  showPlane();
  showBunker();
  showBuilding();
  
  float x = cos(radians(cameraRotationAngle)) * 1000;
  float y = -height/2;
  float z = sin(radians(cameraRotationAngle)) * 1000;
  camera(x, y, z, mouseX - width/2, mouseY - height/2, 0, 0, 1, 0);
}

void updateCameraCoordinates() {
  if (keyPressed) {
    if (key == 'd') {
      cameraRotationAngle -= 10;
    } else if (key == 'a') {
      cameraRotationAngle += 10;
    }
  }
}

void showBunker() {
  pushMatrix();
  rotateY(35);
  translate(300, -110, 0);
  textSize(20);
  specular(65, 97, 2); 
  shininess(100);
  texturedCube(bunkerTexture, 100, 100, 100);
  popMatrix();
}

void showBuilding() {
  pushMatrix();
  rotateX(PI);
  translate(0, 10, 300);
  scale(0.03);
  specular(255, 255, 255); 
  shininess(100);
  shape(tower);
  popMatrix();
}

void showPlane() {
  pushMatrix();
  scale(5);
  translate(40, -90, -10);
  rotateX(PI);
  rotateZ(PI/4);
  specular(65, 97, 2); 
  shininess(100);
  shape(plane);
  popMatrix();
}

void texturedCube(PImage tex, int cubeWidth, int cubeHeight, int deep) {
  beginShape(QUADS);
  texture(tex);

  // +Z "front" face
  vertex(-cubeWidth, -cubeHeight, deep,0, 0);
  vertex( cubeWidth,-cubeHeight, deep,cubeHeight,0);
  vertex( cubeWidth, cubeHeight, deep,cubeHeight,cubeHeight);
  vertex(-cubeWidth,  cubeHeight, deep ,0, cubeHeight);

  // -Z "back" face
  vertex( cubeWidth,-cubeHeight, -deep, 0, 0);
  vertex(-cubeWidth, -cubeHeight, -deep, cubeHeight,0);
  vertex(-cubeWidth,  cubeHeight,-deep, cubeHeight,cubeHeight);
  vertex( cubeWidth, cubeHeight,-deep, 0, cubeHeight);

  // +Y "bottom" face
  vertex(-cubeWidth,  cubeHeight, deep,0, 0);
  vertex( cubeWidth, cubeHeight, deep,cubeWidth,0);
  vertex( cubeWidth, cubeHeight,-deep, cubeWidth,cubeWidth);
  vertex(-cubeWidth,  cubeHeight,-deep, 0, cubeWidth);

  // -Y "top" face
  vertex(-cubeWidth, -cubeHeight, -deep, 0, 0);
  vertex( cubeWidth,-cubeHeight, -deep, cubeWidth,0);
  vertex( cubeWidth,-cubeHeight,  deep,cubeWidth,cubeWidth);
  vertex(-cubeWidth, -cubeHeight, deep, 0, cubeWidth);

  // +X "right" face
  vertex( cubeWidth,-cubeHeight,  deep,0, 0);
  vertex( cubeWidth,-cubeHeight, -deep, cubeWidth,0);
  vertex( cubeWidth, cubeHeight,-deep, cubeWidth,cubeWidth);
  vertex( cubeWidth, cubeHeight, deep,0, cubeWidth);

  // -X "left" face
  vertex(-cubeWidth, -cubeHeight, -deep, 0, 0);
  vertex(-cubeWidth, -cubeHeight,  deep,cubeWidth,0);
  vertex(-cubeWidth,  cubeHeight, deep,cubeWidth,cubeWidth);
  vertex(-cubeWidth,  cubeHeight,-deep, 0, cubeWidth);

  endShape();
}
