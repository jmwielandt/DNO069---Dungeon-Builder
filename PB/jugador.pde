class Entidad{
  HitBox hit;
  float speed_x = 0;
  float speed_y = 0;
  boolean cayendo = false;
  color c;
  
  Entidad(float x_, float y_, int w_, int h_, color c_){
    hit = new HitBox(x_, y_, w_, h_);  //la hitbox
    c = c_;  // color
    
  }
  
  void move(){
    hit.move(speed_x, speed_y);
  }
  
}
