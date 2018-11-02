void update(){
  //println(keys_down[0], keys_down[1], keys_down[2], keys_down[3]);
  // puedo tener varios "true" al mismo tiempo, es bueno saberlo.
  if (!keys_down[0] && !keys_down[1] && !keys_down[2] && keys_down[3]){  // derecha
    mundo.jug.speed_x = mundo.speed;
  } else if (!keys_down[0] && !keys_down[1] && keys_down[2] && !keys_down[3]){  // izquierda
    mundo.jug.speed_x = -mundo.speed;
  } else if (keys_down[0] && !keys_down[1] && !keys_down[2] && keys_down[3]){  // arriba derecha
    mundo.jug.speed_y = -mundo.speed/2;
    mundo.jug.speed_x = mundo.speed/2;
  } else if (!keys_down[0] && keys_down[1] && !keys_down[2] && keys_down[3]){  // abajo derecha
    mundo.jug.speed_y = mundo.speed/2;
    mundo.jug.speed_x = mundo.speed/2;
  } else if (keys_down[0] && !keys_down[1] && keys_down[2] && !keys_down[3]){  // arriba izquierda
    mundo.jug.speed_y = -mundo.speed/2;
    mundo.jug.speed_x = -mundo.speed/2;
  } else if (!keys_down[0] && keys_down[1] && keys_down[2] && !keys_down[3]){  // abajo izquierda
    mundo.jug.speed_y = mundo.speed/2;
    mundo.jug.speed_x = -mundo.speed/2;
  } else if (keys_down[0] && !keys_down[1] && !keys_down[2] && !keys_down[3]){  // arriba
    mundo.jug.speed_y = -mundo.speed;
  } else if (!keys_down[0] && keys_down[1] && !keys_down[2] && !keys_down[3]){  // abajo
    mundo.jug.speed_y = mundo.speed;
  }
  
  mundo.jug.move();  // actualiza tu posición!
  mundo.jug.speed_x = prox_to_zero(mundo.jug.speed_x, 0.5);
  mundo.jug.speed_y = prox_to_zero(mundo.jug.speed_y, 0.5);
}
