class Juego extends Mapa{
  int[] keys = {65, 68, 87, 83};
  // a, d, w, s, " ".
  boolean[] kp = {false, false, false, false};
  // izquierda, derecha, arriba, abajo
  
  Juego(int w, int h){
    super(w, h);
  }
  
  void cope(boolean state){
    for (int i = 0; i < this.keys.length; i++){
      if (this.keys[i] == keyCode){
        this.kp[i] = state;
      }
    }
  }
  
  
}


class Mapa{
  int[][] grilla;
  int w;
  int h;
  
  Mapa(int w, int h){
    this.w = w;
    this.h = h;
    this.grilla = new int[w][h];
    for (int i = 0; i < w; i++){
      for (int j = 0; j < h; j++){
        if (noise(i, j) < PROB_BLOQUE){
          this.grilla[i][j] = 1;
        } else{
          this.grilla[i][j] = 0;
        }
      }
    }
  }
  
  void draw(){
    for (int i = 0; i < this.w; i++){
      for (int j = 0; j < this.h; j++){
        if (this.grilla[i][j] == 0){
          fill(200);
        } else{
          fill(60);
        }
        rect(i * tile, j * tile, tile, tile);
      }
    }
  }
}


class Tileset{
  
  Tileset(){}
}


class Tile{
  int id;
  String name;
  boolean colide;
  boolean breakable;
  boolean reemplazable;
  PImage[] frames;
  
  Tile(JSONObject aaa){
    this.id = aaa.getInt("id");
    this.name = aaa.getString("name");
    
  }
}
