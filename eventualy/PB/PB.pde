Config config;
Mundo mundo;
int[] keys_check = {87, 83, 65, 68, 32};
boolean[] keys_down = new boolean[keys_check.length];
boolean caps;

void settings(){
  JSONObject aux_c = loadJSONObject("config.json");
  config = new Config(aux_c.getInt("tile"), aux_c.getInt("screen_x"), aux_c.getInt("screen_y"), aux_c.getFloat("zoom"));
  size(config.tile * config.screen_x, config.tile * config.screen_y);
}

void setup(){
  mundo = new Mundo("nivel2", 15, 17, 45, 45, 30, 30);
  noStroke();
  frameRate(60);
}

void draw(){
  update();
  background(255);
  fill(0);
  for (int i=0; i < mundo.mapa.grilla.length; i++){
    for (int j=0; j < mundo.mapa.grilla[i].length; j++){
      if (mundo.mapa.grilla[i][j] == 1){
        rect(i*config.tile, j*config.tile, config.tile, config.tile);
      }
    }
  }
  fill(mundo.jug.c);
  rect(mundo.jug.hit.x, mundo.jug.hit.y, mundo.jug.hit.w, mundo.jug.hit.h);
  
}

void keyPressed(){
  //println(key);
  //caps = Toolkit.getDefaultToolkit().getLockingKeyState(KeyEvent.VK_CAPS_LOCK);
  copeKeys(true);
}

void keyReleased(){
  copeKeys(false);
}
