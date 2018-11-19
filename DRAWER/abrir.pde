void open(File file){
  println(file);
  if (file == null){
    println("Nada");
  } else{
    JSONObject aux = loadJSONObject(file);
    int w = aux.getInt("width");
    int h = aux.getInt("heigth");
    mw = new MapBox(500, 300, 50, 80, 32, new Mapa(w, h));
    cargado = true;
  }
}
