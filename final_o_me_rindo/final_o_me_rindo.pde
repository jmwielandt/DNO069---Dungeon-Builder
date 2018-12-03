import processing.opengl.*;

Juego jue;
Jugador jug;


void settings(){
  fullScreen();
  size(SCR_W * tile, SCR_H * tile, P2D);
  //noSmooth();
  
}

void setup(){
  ((PGraphicsOpenGL)g).textureSampling(3);
  // sacado de: https://forum.processing.org/two/discussion/comment/22759/#Comment_22759
  // por un bug de processing que por alguna razón lleva desde el 2014 o antes, noSmooth()
  // no funciona con los distintos modos de renderizado de imágenes y demás :face_palm:
  noStroke();
  
  //tint();
  jue = new Juego(W_TILES, H_TILES);
  jug = new Jugador(5, 4, TAM, TAM);
  frameRate(FRAMES);
  //println(width, height);
  tile = min(width / SCR_W, height / SCR_H);
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
