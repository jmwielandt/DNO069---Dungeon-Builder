class Mundo{
  Mapa mapa;
  Entidad jug;
  float speed = 3;
  
  Mundo(String file, int w, int h, float x, float y, int wid, int hei){
    mapa = new Mapa(file, w, h);
    jug = new Entidad(x, y, wid, hei, color(0, 0, 255));
    //
  }
}
