float cameraRotationAngle;
PShape plane, tank, tower;
PImage tankTexture;

void setup() {
  size(800, 800, P3D);
  noStroke();
  cameraRotationAngle = 0;
  plane = loadShape("./data/plane.obj");
  tank = loadShape("./data/tank1.obj");
  tankTexture = loadImage("./data/tankTexture.png");
  plane.setTexture(tankTexture);
  tower = loadShape("./data/tower.obj");
}

void draw() {
  background(200, 200, 200);
  
  updateCameraCoordinates();
  
  lights();
  lightSpecular(100, 100, 100);
  directionalLight(255, 255, 255, width/2, height/2, (height/2.0) / tan(PI*30.0 / 180.0));
  
  fill(150, 150, 150);
  box(1000, 20, 1000);
  
  showPlane();
  showTanks();
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

void showTanks() {
  pushMatrix();
  rotateY(35);
  translate(10, -10, 0);
  scale(20);
  rotateX(PI);
  specular(65, 97, 2); 
  shininess(10);
  shape(tank);
  translate(5, 0, 10);
  shape(tank);
  translate(10, 0, -20);
  shape(tank);
  popMatrix();
}

void showBuilding() {
  pushMatrix();
  rotateX(PI);
  translate(0, 10, 300);
  scale(0.03);
  specular(255, 255, 255); 
  shininess(20);
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
