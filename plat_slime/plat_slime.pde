ScreenMap map;
Entity jug;
int[] keys = {87, 65, 83, 68, 32};  // {wasd }
boolean[] keys_pressed = {false, false, false, false, false};
int speed = 3;
int jump = -11;
float roce = 0.5;
float roce_a = 0.1;
float grav = 0.6;



void settings(){
  size(32*8, 32*8, P2D);
  noSmooth();
}

void setup(){
  map = new ScreenMap(8, 8);
  jug = new Entity(3.1, 2, 24, 24);
  background(255);
  frameRate(60);
}

void draw(){
  update();
  map.auto_draw();
  jug.auto_draw();
}

void keyPressed(){
  //println(key, keyCode);
  cop_keys(true);
}

void keyReleased(){
  cop_keys(false);
}
