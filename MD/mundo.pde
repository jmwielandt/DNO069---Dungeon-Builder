class Mundo{
  Mapa mapa;
  Jugador jug;
  
  Mundo(String file, int w, int h, int x, int y, int wid, int hei){
    mapa = new Mapa(file, w, h);
    jug = new Jugador(x, y, hei, wid);
    //
  }
  
  void try_move(int dx, int dy){
  }
}
