class Mapa{
  int[][] mapa;
  Mapa(int w, int h){
    noiseSeed(time_seed());
    mapa = new int[w][h];
    int[] posibs = {0, 1, 2};
    float[] probs = new float[3];
    float rnd;
    for (int i = 0; i < w; i++){
      for (int j = 0; j < h; j++){
        if (j < 5){
          probs[0] = 1;
          probs[1] = 0;
          probs[2] = 0;
        } else if (j < 10){
          probs[0] = 0;
          probs[1] = 0.7;
          probs[2] = 1;
        } else if (j < 20){
          probs[0] = 0;
          probs[1] = 0.5;
          probs[2] = 1;
        } else{
          probs[0] = 0;
          probs[1] = 0.3;
          probs[2] = 1;
        }
        rnd = noise(i, j);
        mapa[i][j] = det_block(rnd, posibs, probs);
      }
    }
  }
}
