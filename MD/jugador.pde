class Jugador{
  float x;
  float y;
  int wid;
  int hei;
  int speed;
  color c = color(0, 0, 255);
  
  
  
  Jugador(float x_, float y_, int wid_, int hei_){
    x = x_;
    y = y_;
    wid = wid_;
    hei = hei_;
    speed = 5;
    
  }
  
  void move(float dx, float dy){
    
    x += dx;
    y += dy;
  }
  
}
