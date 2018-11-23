void cop_keys(boolean state){
  for (int i=0; i<keys.length; i++){
    if (keys[i] == keyCode){
      keys_pressed[i] = state;
    }
  }
}

void update(){
  // println(frameRate);
  jug.hay_caida();
  println(jug.cayendo);
  if (jug.cayendo){
    jug.speed_x = prox_to_zero(jug.speed_x, roce_a);
  } else{
    jug.speed_x = prox_to_zero(jug.speed_x, roce);
  }
  
  if (jug.cayendo){
    jug.speed_y += grav;
  } else{
    jug.speed_y = 0;
  }
  
  if (keys_pressed[1] && !keys_pressed[3]){
    jug.speed_x = -speed;
  } else if (!keys_pressed[1] && keys_pressed[3]){
    jug.speed_x = speed;
  }
  
  jug.move();
}
