class Mapa{
  int[][] grilla;
  int wid;
  int hei;
  Mapa(int w, int h){
    wid = w;
    hei = h;
    grilla = new int[w][h];
    for (int i=0; i<w; i++){
      for (int j=0; j<h; j++){
        grilla[i][j] = 0;
      }
    }
  }
}
