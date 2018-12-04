void reset_level(){
  jue = new Juego(W_TILES, H_TILES, nivel_actual);
  jug = new Jugador(init[0], init[1], TAM, TAM);
}

void back_menu(){
  paused = true;
  screen = 0;
  but1.hide();
  but2.hide();
  but3.show();
  but4.show();
  but5.show();
  but6.show();
}

void jugar_nivel_1(){
  paused = false;
  screen = 1;
  nivel_actual = PRIMER_NIVEL;
  but3.hide();
  but4.hide();
  but5.hide();
  but6.hide();
  but1.show();
  but2.show();
  reset_level();
}

void jugar_nivel_2(){
  paused = false;
  screen = 1;
  nivel_actual = SEGUNDO_NIVEL;
  but3.hide();
  but4.hide();
  but5.hide();
  but6.hide();
  but1.show();
  but2.show();
  reset_level();
}

void jugar_nivel_3(){
  paused = false;
  screen = 1;
  nivel_actual = PRIMER_NIVEL;
  but3.hide();
  but4.hide();
  but5.hide();
  but6.hide();
  but1.show();
  but2.show();
  reset_level();
}



void update(){
  if (!paused){
    if (jue.kp[0] && !jue.kp[1]){
      jug.vel_x = -SPEED;
    } else if (!jue.kp[0] && jue.kp[1]){
      jug.vel_x = SPEED;
    }
    if (jue.kp[2] && ! jue.kp[3]){
      jug.vel_y = -SPEED;
    } else if (!jue.kp[2] && jue.kp[3]){
      jug.vel_y = SPEED;
    }
    
    jug.move();
    jug.update_stage();
    jug.update_face();
  }
}

float prox_to_zero(float a, float b){
  if (a >= 0){
    return max(0, a - b);
  } else{
    return min(0, a + b);
  }
}
