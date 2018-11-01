// JSONObject config;
int tile = 10;
int[] ground = {150, 100, 60};
int[] rock = {150, 150, 150};
int i, j = 0;


void setup(){
  println("hola mundo");
  size(300, 300); //tamaño pantalla
  noStroke();
  background(255);
  delay(0);
}

void draw(){
  // vamos de a poco mejor
  // paso 1: poner bloques con pesos.
  //println(i, j);
  float rnd = noise(i, j);
  if (j < 10){
    if (det_block(rnd, 0.7)){
      fill(ground[0], ground[1], ground[2]);
    } else{
      fill(rock[0], rock[1], rock[2]);
    }
  } else if (j < 20){
    if (det_block(rnd, 0.5)){
      fill(ground[0], ground[1], ground[2]);
    } else{
      fill(rock[0], rock[1], rock[2]);
    }
  } else{
    if (det_block(rnd, 0.3)){
      fill(ground[0], ground[1], ground[2]);
    } else{
      fill(rock[0], rock[1], rock[2]);
    }
  }
  
  rect(i*tile, j*tile, tile, tile);
  
  if (j+1 > 29){
    if (i+1 > 29){
      noLoop();
    } else{
      i++;
      j = 0;
    }
  } else{
    j++;
  }
  
  
  
  /*
  update();
  background(80, 0, 0);  // pintar fondo
  noStroke();  // no poner bordes a rectángulos
  fill(255);
  rect(20, 20, 40, 40);
  
  stroke(255);  //color borde!
  fill(255, 50, 200);
  rect(65, 20, 70, 70);
  println("todo bien!");*/
  /*
  float[] vect = new float[100];
  noStroke();
  int max_depth = 30;
  for (int i=0; i<30; i++){
    for (int j=0; j<30; j++){
      float aux = noise(i, j);
      // aux -> ground
      // 1 - aux -> rock
      fill(aux * ground[0] * (max_depth - j)/max_depth + (1 - aux) * rock[0] * j/max_depth, 
           aux * ground[1] * (max_depth - j)/max_depth + (1 - aux) * rock[1] * j/max_depth, 
           aux * ground[2] * (max_depth - j)/max_depth + (1 - aux) * rock[2] * j/max_depth);
      rect(i*tile, j*tile, (i+1) * tile, (j+1) * tile);
    }
  }*/
}
