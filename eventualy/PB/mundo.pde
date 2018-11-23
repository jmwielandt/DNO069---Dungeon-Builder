class Mundo{
  Mapa mapa;
  Entidad jug;
  float speed = 3;
  int[] keys_check = {87, 83, 65, 68, 32};
  boolean[] keys_down = new boolean[keys_check.length];
  boolean caps;
  
  Mundo(String file, int w, int h, float x, float y, int wid, int hei){
    this.mapa = new Mapa(file, w, h);
    this.jug = new Entidad(x, y, wid, hei, color(0, 255, 0));
    //
  }
  
  void hay_caida(){
    if(this.jug.hit.y + this.jug.hit.h < height){
      this.jug.cayendo = true;
    } else{
      this.jug.cayendo = false;
    }
  }
  
  void keyDown(){
    this.copeKeys(true);
  }
  
  void keyUp(){
    this.copeKeys(false);
  }
  
  void copeKeys(boolean state){
  for (int i=0; i < this.keys_check.length; i++){
    if (this.keys_check[i] == keyCode){
      this.keys_down[i] = state;
    }
  }
}
  
}
