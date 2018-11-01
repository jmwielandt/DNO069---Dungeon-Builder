class Mapa{
  int[][] mapa;
  Mapa(int w, int h){
    noiseSeed(time_seed());
    mapa = new int[w][h];
    float corte;
    float rnd;
    for (int i = 0; i < w; i++){
      for (int j = 0; j < h; j++){
        rnd = noise(i, j);
        if (j < 10){
          corte = 0.7;
        } else if (j < 20){
          corte = 0.5;
        } else{
          corte = 0.3;
        }
        if (rnd <= corte){
          mapa[i][j] = 1;
        } else{
          mapa[i][j] = 2;
        }
      }
    }   
  }
}
