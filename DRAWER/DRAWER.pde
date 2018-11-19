
int[] keys_check = {65, 83, 68, 87};
boolean[] keys_down = new boolean[keys_check.length];
//65, 83, 68, 87
// izquierda, abajo, derecha, arriba
boolean clicked_on = false;
int speed = 5;


MapBox mw;
boolean cargado = false;
color[] colores = {color(255), color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};

void settings(){
  size(600, 400);
}


void setup(){
  //open("hola");
  background(0);
  selectInput("Selecciona una base", "open");
  frameRate(45);
}

void draw(){
  if (cargado){
    updater();
    background(0);
    stroke(0);
    strokeWeight(1);
    //println(floor(x / tile_s));
    
    /// DIBUJAR MAPA
    mw.auto_draw();
    
    /// DIBUJAR MÁRGENES
    stroke(colores[1]);
    strokeWeight(5);
    line(0, mw.dely, width, mw.dely);  // margen arriba
    line(mw.delx, 0, mw.delx, height);  // margen izquierda
    line(0, mw.dely + mw.syv, width, mw.dely + mw.syv);  // margen abajo
    line(mw.delx + mw.sxv, 0, mw.delx + mw.sxv, height);  // margen derecho
  }
}

void keyPressed(){
  copeKeys(true);
}

void keyReleased(){
  copeKeys(false);
}

void mousePressed(){
  println(mouseX, mouseY);
  mw.its_me(mouseX, mouseY);
}

void mouseDragged(){

}

void mouseReleased(){

}
