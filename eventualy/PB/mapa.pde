class Mapa{
  int[][] grilla;
  
  Mapa(String file, int w, int h){
    JSONArray arch = get_map(file);
    this.grilla = new int[w][h];
    this.llenar_grilla(arch);
  }
  
  JSONArray get_map(String file){
    return loadJSONArray(file + ".json");
  }
  
  void llenar_grilla(JSONArray cargado){
    for (int i=0; i < cargado.size(); i++){
      JSONArray aux = cargado.getJSONArray(i);
      for (int j=0; j < aux.size(); j++){
        this.grilla[i][j] = aux.getInt(j);  //lo transpuse sin darme cuenta al hacer el json
      }
    }
  }
  
}
