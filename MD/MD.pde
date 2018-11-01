JSONObject config;
Mapa mundo;

void settings(){
  config = loadJSONObject("config.json");
  size(config.getInt("tile") * config.getInt("screen_x"),
       config.getInt("tile") * config.getInt("screen_y"));
  
}

void setup(){
  noStroke();
  noSmooth();
  background(255);
  fill(0);
  int[][] a = {{1, 2}, {3}};
  for (int[] i : a){
    println(i);
  }
  mundo = new Mapa("bosque", 16, 9); 
  frameRate(60);
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

void mousePressed(){
  if (floor(mouseX/config.getInt("tile")) >= 0 && floor(mouseX/config.getInt("tile")) < config.getInt("screen_x")
      && floor(mouseY/config.getInt("tile")) >= 0 && floor(mouseY/config.getInt("tile")) < config.getInt("screen_y")){
        
        if (mouseButton == LEFT){
          mundo.grilla[floor(mouseX/config.getInt("tile"))][floor(mouseY/config.getInt("tile"))] += 1;
        }else if(mouseButton == RIGHT){
          mundo.grilla[floor(mouseX/config.getInt("tile"))][floor(mouseY/config.getInt("tile"))] -= 1;
        }
      }
}
void mouseDragged(){
  if (floor(mouseX/config.getInt("tile")) >= 0 && floor(mouseX/config.getInt("tile")) < config.getInt("screen_x")
      && floor(mouseY/config.getInt("tile")) >= 0 && floor(mouseY/config.getInt("tile")) < config.getInt("screen_y")){
    if (floor(mouseX/config.getInt("tile")) != floor(pmouseX/config.getInt("tile")) 
        || floor(mouseY/config.getInt("tile")) != floor(pmouseY/config.getInt("tile"))){
          
      
      if (mouseButton == LEFT){
          mundo.grilla[floor(mouseX/config.getInt("tile"))][floor(mouseY/config.getInt("tile"))] += 1;
        }else if(mouseButton == RIGHT){
          mundo.grilla[floor(mouseX/config.getInt("tile"))][floor(mouseY/config.getInt("tile"))] -= 1;
        }
    }
  }
}
