JSONObject config;
Mundo mundo;
int[] keys_check = {87, 83, 65, 68, 32};
boolean[] keys_down = new boolean[keys_check.length];


void settings(){
  boolean[] a = {true, false};
  boolean[] b = {true, false};
  println(equals(a, b));
  config = loadJSONObject("config.json");
  size(config.getInt("tile") * config.getInt("screen_x"),
       config.getInt("tile") * config.getInt("screen_y"));
  
}

void setup(){
  noStroke();
  mundo = new Mundo("nivel", 15, 17, 
                    1 * config.getInt("tile"), 
                    15 * config.getInt("tile") + 10, 
                    config.getInt("tile"), 
                    config.getInt("tile") - 10);
  frameRate(60);
  //noLoop();
  
}

void draw(){
  update();
  background(255);
  fill(0);
  int aux = config.getInt("tile");
  for (int i=0; i < mundo.mapa.grilla.length; i++){
    //println(mundo.grilla[i]);
    for (int j=0; j < mundo.mapa.grilla[i].length; j++){
      if (mundo.mapa.grilla[i][j] == 1){
        rect(i*aux, j*aux, aux, aux);
      }
    }
  }
  fill(mundo.jug.c);
  rect(mundo.jug.cajita.x, mundo.jug.cajita.y, mundo.jug.cajita.w, mundo.jug.cajita.h);
  
}

void keyPressed(){
  println(keyCode);
  copeKeys(true);
}

void keyReleased(){
  println("b");
  copeKeys(false);
}
