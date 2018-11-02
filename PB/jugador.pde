class Entidad{
  HitBox cajita;
  float speed_x = 0;
  float speed_y = 0;
  color c;
  
  Entidad(float x_, float y_, int w_, int h_, color c_){
    cajita = new HitBox(x_, y_, w_, h_);  //la hitbox
    c = c_;  // color
    
  }
  
  void move(){
    cajita.move(speed_x, speed_y);
  }
  
}
