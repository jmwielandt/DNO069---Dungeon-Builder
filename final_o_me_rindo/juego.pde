class Juego extends Mapa{
  int[] keys = {65, 68, 87, 83, 32};
  // a, d, w, s, " ".
  boolean[] kp = {false, false, false, false, false};
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
  
  void block(int x, int y){
    int aux = this.grilla[x][y];
    if (this.kp[4]){
      // colocar
      
    } else{
      // romper
    }
  }
  
  
}


class Mapa{
  int[][] grilla;
  int w;
  int h;
  Tileset ts;
  int piso;
  
  Mapa(int w, int h){
    this.ts = new Tileset();
    this.w = w;
    this.h = h;
    this.grilla = new int[w][h];
    JSONObject aux = loadJSONObject(PRIMER_NIVEL);
    this.piso = aux.getInt("floor");
    JSONArray g = aux.getJSONArray("layout");
    for (int i = 0; i < w; i++){
      JSONArray g2 = g.getJSONArray(i);
      for (int j = 0; j < h; j++){
        this.grilla[i][j] = g2.getInt(j);
        /*
        
        if (noise(i, j) < PROB_BLOQUE){
          this.grilla[i][j] = 1;
        } else{
          this.grilla[i][j] = this.piso;
        }
        */
      }
    }
  }
  
  void draw(){
    for (int i = 0; i < this.w; i++){
      for (int j = 0; j < this.h; j++){
        /*
        if (this.grilla[i][j] == 0){
          fill(200);
        } else{
          fill(60);
        }
        rect(i * tile, j * tile, tile, tile);*/
        this.ts.tiles[this.grilla[i][j]].draw(i, j);
      }
    }
  }
}


class Tileset{
  Tile[] tiles;
  
  Tileset(){
    JSONArray aux = loadJSONArray("bloquepedia.json");
    this.tiles = new Tile[aux.size()];
    for (int j = 0; j < aux.size(); j++){
      this.tiles[j] = new Tile(aux.getJSONObject(j));
    }
  }
}


class Tile{
  int id;
  String name;
  boolean colide;
  boolean breakable;
  boolean reemplazable;
  PImage[] frames;
  int mod;
  
  Tile(JSONObject aaa){
    this.id = aaa.getInt("id");
    this.name = aaa.getString("name");
    this.colide = aaa.getBoolean("colide");
    this.breakable = aaa.getBoolean("breakable");
    this.reemplazable = aaa.getBoolean("reemplazable");
    JSONArray aux = aaa.getJSONArray("frames");
    this.frames = new PImage[aux.size()];
    for (int i=0; i<frames.length; i++){
      this.frames[i] = loadImage("assets/" + aux.getString(i));
    }
    this.mod = FRAMES / frames.length;
  }
  
  void draw(int x, int y){
    image(this.frames[(frameCount % FRAMES) / this.mod], x * tile, y * tile, tile, tile);
    //println((frameCount % FRAMES) / this.mod);
  }
}
