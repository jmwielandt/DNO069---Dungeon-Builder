class Mapa{
  int[][] grilla;
  
  Mapa(String file, int w, int h){
    JSONArray arch = get_map(file);
    grilla = new int[w][h];
    llenar_grilla(arch);
  }
  
  JSONArray get_map(String file){
    return loadJSONArray(file + ".json");
  }
  
  void llenar_grilla(JSONArray cargado){
    for (int i=0; i < cargado.size(); i++){
      JSONArray aux = cargado.getJSONArray(i);
      //println(aux);
      for (int j=0; j < aux.size(); j++){
        grilla[j][i] = aux.getInt(j);  //lo transpuse sin darme cuenta al hacer el json
      }
    }
  }
  
}
