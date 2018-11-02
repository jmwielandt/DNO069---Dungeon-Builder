JSONObject config;
Mapa mundo;

void settings(){
  config = loadJSONObject("config.json");
  size(config.getInt("tile") * config.getInt("screen_x"),
       config.getInt("tile") * config.getInt("screen_y"));
  
}

void setup(){
  //noStroke();
  noSmooth();
  mundo = new Mapa("bosque", config.getInt("screen_x"), config.getInt("screen_y")); 
  //frameRate(60);
  noLoop();
}

void draw(){
  background(255);
  
  for (int i=0; i < mundo.grilla.length; i++){
    for (int j=0; j < mundo.grilla[i].length; j++){
      int aux = mundo.grilla[i][j];
      if (aux >= 0 && aux < mundo.tiles.size()){
        JSONObject bloque = mundo.tiles.getJSONObject(mundo.grilla[i][j]);
        int[] rgb = bloque.getJSONArray("rgb").getIntArray();
        fill(rgb[0], rgb[1], rgb[2]);
        rect(i*config.getInt("tile"), j*config.getInt("tile"), config.getInt("tile"), config.getInt("tile")); 
      }
    }
  }
}
