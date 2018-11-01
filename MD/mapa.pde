class Mapa{
  int[][] grilla;
  Mapa(String biome, int w, int h){
    JSONObject bioma = get_biome_info(biome);
    noiseSeed(time_seed());
    grilla = new int[w][h];
    vaciar_grilla();
    //llenar_grilla();
    
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
}
