class Mundo{
  Mapa mapa;
  Entidad jug;
  float speed = 3;
  int w;
  int h;
  int dimx = 0;
  int dimy = 0;
  
  Mundo(String file, int w, int h, float x, float y, int wid, int hei){
    this.mapa = new Mapa(file, w, h);
    this.jug = new Entidad(x, y, wid, hei, color(0, 255, 0));
    this.w = w;
    this.h = h;
    this.dimx = w * config.tile;
    this.dimy = h * config.tile;
    //
  }
  
  void hay_caida(){
    
    // ARREGLAR ESTA PARTE!!!
    if(jug.hit.y + jug.hit.h < this.dimy){
      int[][] pos = this.jug.hit.coords();
      println(pos[2][1], this.h, pos[3][1]);
      if (pos[2][1] == this.h - 1 || pos[3][1] == this.h - 1){
        
      } else{ 
        if (this.mapa.grilla[pos[2][0]][pos[2][1] + 1] == 1){
          if (this.jug.hit.y + this.jug.hit.h - (pos[2][1] + 1) * config.tile <= 0){
            //println("holi");
            jug.cayendo = true;
          } else{
            jug.cayendo = false;
          }
        } else if (this.mapa.grilla[pos[3][0]][pos[3][1] + 1] == 1){
          if (this.jug.hit.y + this.jug.hit.h - (pos[3][1] + 1) * config.tile <= 0){
            jug.cayendo = true;
          } else{
            jug.cayendo = false;
          }
        } else{
          jug.cayendo = true;
        }
      }
    } else{
      jug.cayendo = false;
    }
  }
}
