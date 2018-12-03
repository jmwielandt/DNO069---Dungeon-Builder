void update(){
  if (jue.kp[0] && !jue.kp[1]){
    jug.vel_x = -SPEED;
    //println("izquierda!");
  } else if (!jue.kp[0] && jue.kp[1]){
    jug.vel_x = SPEED;
    //println("\tderecha!");
  }
  if (jue.kp[2] && ! jue.kp[3]){
    jug.vel_y = -SPEED;
    //println("arriba!");
  } else if (!jue.kp[2] && jue.kp[3]){
    jug.vel_y = SPEED;
    //println("abajo!");
  }
  
  jug.move();
  //println(jug.vel_x, jug.vel_y);
}

float prox_to_zero(float a, float b){
  if (a >= 0){
    return max(0, a - b);
  } else{
    return min(0, a + b);
  }
}
