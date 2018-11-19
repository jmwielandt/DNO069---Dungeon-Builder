class HitBox{
  float x;
  float y;
  float w;
  float h;
  // String status;
  // quieto, caminando, saltando, cayendo
  
  HitBox(float x_, float y_, float w_, float h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  } // config.tile
  
  int[][] coords(){
    int[][] pos = new int[4][2];
    pos[0][0] = floor(x/config.tile);
    pos[0][1] = floor(y/config.tile);
    
    pos[1][0] = floor((x + w - 0.01)/config.tile);
    pos[1][1] = floor(y/config.tile);
    
    pos[2][0] = floor(x/config.tile);
    pos[2][1] = floor((y + h - 0.01)/config.tile);
    
    pos[3][0] = floor((x + w - 0.01)/config.tile);
    pos[3][1] = floor((y + h - 0.01)/config.tile);
    
    return pos;
  }
  
  void move(float sx, float sy){
    x += sx;
    y += sy;
    
    if (x < 0){
      x = 0;
    } else if (x + w > width){
      x = width - w;
    }
    if (y < 0){
      y = 0;
    } else if (y + h > height){
      y = height - h;
    }
  }
}
