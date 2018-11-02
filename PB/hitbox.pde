class HitBox{
  float x;
  float y;
  float w;
  float h;
  
  HitBox(float x_, float y_, float w_, float h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  
  int[][] coords(){
    int[][] pos = new int[4][2];
    pos[0][0] = floor(x/config.getInt("tile"));
    pos[0][1] = floor(y/config.getInt("tile"));
    
    pos[1][0] = floor((x + w - 0.01)/config.getInt("tile"));
    pos[1][1] = floor(y/config.getInt("tile"));
    
    pos[2][0] = floor(x/config.getInt("tile"));
    pos[2][1] = floor((y + h - 0.01)/config.getInt("tile"));
    
    pos[3][0] = floor((x + w - 0.01)/config.getInt("tile"));
    pos[3][1] = floor((y + h - 0.01)/config.getInt("tile"));
    
    return pos;
  }
  
  void move(float sx, float sy){
    x += sx;
    y += sy;
  }
}
