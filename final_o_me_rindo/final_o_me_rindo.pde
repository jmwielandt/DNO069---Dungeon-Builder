Juego jue;
Jugador jug;


void settings(){
  size(SCR_W * tile, SCR_H * tile, P2D);
}

void setup(){
  jue = new Juego(W_TILES, H_TILES);
  jug = new Jugador(5, 4, TAM, TAM);
  noSmooth();
  frameRate(FRAMES);
}

void draw(){
  background(0);
  update();
  jue.draw();
  jug.draw();
}


void keyPressed(){
  jue.cope(true);
  //println(key, keyCode);
}

void keyReleased(){
  jue.cope(false);
}
