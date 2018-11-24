void update(){
  /*if (mundo.jug.cayendo){
    mundo.jug.c = color(255, 0, 0);
  } else{
    mundo.jug.c = color(0, 255, 0);
  }*/
  
  mundo.hay_caida();
  
  if (mundo.jug.cayendo){  // gravedad en y
    mundo.jug.speed_y += 0.6;
  } else{
    mundo.jug.speed_y = 0;
  }
  
  if (!mundo.jug.cayendo){  // roce en x
    mundo.jug.speed_x = prox_to_zero(mundo.jug.speed_x, 0.5);
  } else{
    mundo.jug.speed_x = prox_to_zero(mundo.jug.speed_x, 0.1);
  }
  
  //println(keys_down[0], keys_down[1], keys_down[2], keys_down[3]);
  // puedo tener varios "true" al mismo tiempo, es bueno saberlo.
  if (keys_down[4] && !mundo.jug.cayendo){
    mundo.jug.speed_y = -8;
  }
  if (!keys_down[0] && !keys_down[1] && !keys_down[2] && keys_down[3]){  // derecha
    mundo.jug.speed_x = mundo.speed;
  } else if (!keys_down[0] && !keys_down[1] && keys_down[2] && !keys_down[3]){  // izquierda
    mundo.jug.speed_x = -mundo.speed;
  }
  
  mundo.jug.move();  // actualiza tu posición!
  
}
