Config config;
Mundo mundo;
int[] keys_check = {87, 83, 65, 68, 32};
boolean[] keys_down = new boolean[keys_check.length];
boolean caps;

void settings(){
  JSONObject aux_c = loadJSONObject("config.json");
  config = new Config(aux_c.getInt("tile"), aux_c.getInt("screen_x"), aux_c.getInt("screen_y"), aux_c.getFloat("zoom"));
  size(config.tile * config.screen_x + 100, config.tile * config.screen_y + 100, P2D);
}

void setup(){
  mundo = new Mundo("nivel2", 8, 8, 45, 45, 30, 30);
  //noStroke();
  noSmooth();
  frameRate(60);
}

void draw(){
  update();
  background(0, 0, 255);
  for (int i=0; i < mundo.mapa.grilla.length; i++){
    for (int j=0; j < mundo.mapa.grilla[i].length; j++){
      if (mundo.mapa.grilla[i][j] == 1){
        fill(0);
        rect(i*config.tile, j*config.tile, config.tile, config.tile);
      } else{
        fill(255);
        rect(i*config.tile, j*config.tile, config.tile, config.tile);
      }
    }
  }
  fill(mundo.jug.c);
  rect(mundo.jug.hit.x, mundo.jug.hit.y, mundo.jug.hit.w, mundo.jug.hit.h);
  
}

void keyPressed(){
  copeKeys(true);
}

void keyReleased(){
  copeKeys(false);
}
