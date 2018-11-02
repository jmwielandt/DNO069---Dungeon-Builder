class Mapa{
  int[][] grilla;
  JSONArray tiles;
  JSONArray capas;
  Mapa(String biome, int w, int h){
    JSONObject bioma = get_biome_info(biome);
    tiles = bioma.getJSONArray("tiles");
    capas = bioma.getJSONArray("capas");
    grilla = new int[w][h];
    vaciar_grilla();
    llenar_grilla();
  }
  JSONObject get_biome_info(String biome){
    return loadJSONObject("biomas/" + biome + ".json");
  }
  void vaciar_grilla(){
    for (int i=0; i < grilla.length; i++){
      for (int j=0; j < grilla[i].length; j++){
        grilla[i][j] = -1;
      }
    }
  }
  void llenar_grilla(){
    noiseSeed(time_seed());
    float rnd;
    int c = 0;
    JSONObject capa = capas.getJSONObject(c);
    int end = capa.getInt("end");
    int[] tiles = capa.getJSONArray("tiles").getIntArray();
    float[] probs = capa.getJSONArray("probs").getFloatArray();
    for (int j = 0; j < grilla[0].length; j++){
      for (int i = 0; i < grilla.length; i++){
        rnd = noise(i, j);
        grilla[i][j] = det_bloque(rnd, tiles, probs);
      }
      if (j + 1 > end && c+1 < capas.size()){
        c += 1;
        capa = capas.getJSONObject(c);
        end = capa.getInt("end");
        tiles = capa.getJSONArray("tiles").getIntArray();
        probs = capa.getJSONArray("probs").getFloatArray();
      }
    }
  }
  void decorar(){
    // pasto y árboles
    int c = 0;
  }
}
