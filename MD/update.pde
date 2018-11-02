void update(){
  //println(keys_down[0], keys_down[1], keys_down[2], keys_down[3]);
  // puedo tener varios "true" al mismo tiempo, es bueno saberlo.
  if (keys_down[0] && !keys_down[1]){
    mundo.jug.move(0, -mundo.jug.speed);
    //println("arriba!");
  } else if (keys_down[1] && !keys_down[0]){
    mundo.jug.move(0, mundo.jug.speed);
  } else if (keys_down[2] && !keys_down[3]){
    mundo.jug.move(-mundo.jug.speed, 0);
  } else if (keys_down[3] && !keys_down[2]){
    mundo.jug.move(mundo.jug.speed, 0);
  }
}
