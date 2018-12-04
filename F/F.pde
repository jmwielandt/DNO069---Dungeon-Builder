import processing.opengl.*;
import controlP5.*;

String nivel_actual;

PImage F;

ControlP5 cp5;
Button but1;  // resetear nivel
Button but2;  // volver al nivel
Button but3;  // iniciar nivel 1
Button but4;  // iniciar nivel 2
Button but5;  // iniciar nivel 3
Button but6;  // salir

CallbackListener cb1;
CallbackListener cb2;
CallbackListener cb3;
CallbackListener cb4;
CallbackListener cb5;
CallbackListener cb6;

String title = "Press F to Pay Respects"; // título provisional

PImage victoria;

boolean paused = true;
boolean win = false;
int screen = 0;
// 1: game, 0: main menu

Juego jue;
Jugador jug;


void settings(){
  fullScreen();
  size(SCR_W * tile, SCR_H * tile, P2D);  
}

void setup(){
  ((PGraphicsOpenGL)g).textureSampling(3);
  // sacado de: https://forum.processing.org/two/discussion/comment/22759/#Comment_22759
  // por un bug de processing que por alguna razón lleva desde el 2014 o antes, noSmooth()
  // no funciona con los distintos modos de renderizado de imágenes y demás :face_palm:
  //noStroke();
  textSize(40);
  victoria = loadImage("assets/victoria.png");
  F = loadImage("assets/carátula.jpg");
  tile = min(width / SCR_W, height / SCR_H);
  TAM = tile / OTILE * OCHARA;
  
  cp5 = new ControlP5(this);
  
  cb1 = new CallbackListener(){
    public void controlEvent(CallbackEvent ev){
      if (ev.getAction() == cp5.ACTION_CLICK){
        reset_level();
      }
    }
  };
  
  cb2 = new CallbackListener(){
    public void controlEvent(CallbackEvent ev){
      if (ev.getAction() == cp5.ACTION_CLICK){
        back_menu();
      }
    }
  };
  
  cb3 = new CallbackListener(){
    public void controlEvent(CallbackEvent theEvent){
      if (theEvent.getAction() == cp5.ACTION_CLICK){
        jugar_nivel_1();
      }
    }
  };
  
  cb4 = new CallbackListener(){
    public void controlEvent(CallbackEvent theEvent){
      if (theEvent.getAction() == cp5.ACTION_CLICK){
        jugar_nivel_2();
      }
    }
  };
  
  cb5 = new CallbackListener(){
    public void controlEvent(CallbackEvent theEvent){
      if (theEvent.getAction() == cp5.ACTION_CLICK){
        jugar_nivel_3();
      }
    }
  };
  
  cb6 = new CallbackListener(){
    public void controlEvent(CallbackEvent theEvent){
      if (theEvent.getAction() == cp5.ACTION_CLICK){
        exit();
      }
    }
  };
  
  
  
  but1 = new Button(cp5, "reset level");
  but1.setValue(0);
  but1.setSize(3*tile, tile);
  but1.setPosition(W_TILES * tile, 0);
  but1.addCallback(cb1);
  
  but2 = new Button(cp5, "back to menu");
  but2.setValue(1);
  but2.setPosition(W_TILES * tile, tile);
  but2.setSize(3 * tile, tile);
  but2.addCallback(cb2);
  
  but3 = new Button(cp5, "level 1");
  but3.setValue(2);
  but3.setPosition(width/2 - (int) (1.5 * tile), height / 2);
  but3.setSize(3 * tile, tile);
  but3.addCallback(cb3);
  
  but4 = new Button(cp5, "level 2");
  but4.setValue(3);
  but4.setPosition(width/2 - (int) (1.5 * tile), height / 2 + tile + H_TILES/3);
  but4.setSize(3 * tile, tile);
  but4.addCallback(cb4);
  
  but5 = new Button(cp5, "level 3");
  but5.setValue(4);
  but5.setPosition(width/2 - (int) (1.5 * tile), height / 2 + 2 * tile + 2 * H_TILES/3);
  but5.setSize(3 * tile, tile);
  but5.addCallback(cb5);
  
  but6 = new Button(cp5, "salir");
  but6.setValue(5);
  but6.setPosition(width/2 - (int) (1.5 * tile), height / 2 + 3 * tile + 3 * H_TILES/3);
  but6.setSize(3 * tile, tile);
  but6.addCallback(cb6);
  
  but1.hide();
  but2.hide();
  /*
  but3.hide();
  but4.hide();
  but5.hide();
  but6.hide();
  */
  
  jue = new Juego(W_TILES, H_TILES, PRIMER_NIVEL);
  jug = new Jugador(5, 4, TAM, TAM);
  frameRate(FRAMES);
}

void draw(){
  background(0);
  if (screen == 0){
    image(F, 0, 0, width, height);
    fill(255);
    text(title, width / 4, height / 4);
  } else if (screen == 1){
    update();
    jue.draw();
    jug.draw();
    
    if (win){
      image(victoria, 4 * tile, 3 * tile, 5 * tile, 3 * tile);
      //fill(255, 0, 255);
      //text("VICTORIA", width / 3, height / 2);
    }
  }
}


void keyPressed(){
  jue.cope(true);
}

void keyReleased(){
  jue.cope(false);
}

void mousePressed(){
  if (mouseX < W_TILES * tile && mouseX >= 0 && mouseY >= 0 && mouseY < H_TILES * tile){ 
    int x = mouseX / tile;
    int y = mouseY / tile;
    jue.block(x, y);
  }
  
}
