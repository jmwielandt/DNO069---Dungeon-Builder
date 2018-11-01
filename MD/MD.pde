// JSONObject config;
int tile = 10;
int[] ground = {150, 100, 60};
int[] rock = {150, 150, 150};
int i, j = 0;
Mapa mundo;

void setup(){
  println("hola mundo");
  size(300, 300); //tamaño pantalla
  noStroke();
  background(255);
  loop();
  
}

void draw(){
  println("hola");
  mundo = new Mapa(30, 30);
  // vamos de a poco mejor
  // paso 2: creando el objeto mapa.
  for (int i = 0; i < mundo.mapa.length; i++){
    for (int j = 0; j < mundo.mapa[i].length; j++){
      if (mundo.mapa[i][j] == 1){
        fill(ground[0], ground[1], ground[2]);
      } else{
        fill(rock[0], rock[1], rock[2]);
      }
      rect(i * tile, j * tile, tile, tile);
    }
  }
  delay(1000);
}
