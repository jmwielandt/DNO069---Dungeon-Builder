class HitBox{
  float x;
  float y;
  float w;
  float h;
  boolean ciz = false;
  boolean cde = false;
  // String status;
  // quieto, caminando, saltando, cayendo
  
  HitBox(float x_, float y_, float w_, float h_){
    this.x = x_;
    this.y = y_;
    this.w = w_;
    this.h = h_;
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
    int[][] pos = this.coords();
    // lo voy a hacer primero con los laterales >_<
    
    if (sx < 0){
      if (pos[0][0] == 0){
        sx = max(sx, 0 - this.x);
      } else{      
        int aux3 = mundo.mapa.grilla[pos[0][0] - 1][pos[0][1]];
        int aux4 = mundo.mapa.grilla[pos[2][0] - 1][pos[2][1]];
        if (aux3 == 1 || aux4 == 1){
          sx = max(sx, pos[0][0] * config.tile - this.x);
        }
      }
    } else{
      if (pos[1][0] == mundo.w - 1){
        sx = min(sx, mundo.w * config.tile - this.x);
      } else{      
        int aux3 = mundo.mapa.grilla[pos[1][0] + 1][pos[1][1]];
        int aux4 = mundo.mapa.grilla[pos[3][0] + 1][pos[3][1]];
        if (aux3 == 1 || aux4 == 1){
          sx = min(sx, (pos[1][0] + 1) * config.tile - (this.x + this.w));
        }
      }
    }
    this.x += sx;
    
    if (sy < 0){
      if (pos[0][1] == 0){
        sy = max(sy, 0 - this.y);
      } else{      
        int aux3 = mundo.mapa.grilla[pos[0][0]][pos[0][1] - 1];
        int aux4 = mundo.mapa.grilla[pos[1][0]][pos[1][1] - 1];
        if (aux3 == 1 || aux4 == 1){
          sy = max(sy, pos[0][1] * config.tile - this.y);
        }
      }
    } else{
      if (pos[2][1] == mundo.h - 1){
        sy = min(sy, mundo.h * config.tile - this.y);
      } else{      
        int aux3 = mundo.mapa.grilla[pos[2][0]][pos[2][1] + 1];
        int aux4 = mundo.mapa.grilla[pos[3][0]][pos[3][1] + 1];
        if (aux3 == 1 || aux4 == 1){
          sy = min(sy, (pos[2][1] + 1) * config.tile - (this.y + this.h));
        }
      }
      
    }
    
    
    
    this.y += sy;
    
    if (this.x < 0){
      this.x = 0;
    } else if (this.x + this.w >= width || this.x + this.w >= mundo.dimx){
      this.x = min(width, mundo.mapa.grilla.length * config.tile) - this.w;
    }
    if (this.y < 0){
      this.y = 0;
    } else if (this.y + this.h >= height || this.y + this.h >= mundo.dimy){
      this.y = min(height, mundo.mapa.grilla[0].length * config.tile) - this.h;
    }
  }
  
  void colision(float sx, float sy){
    int[][] pos = this.coords();
    if (this.x == 0){
      this.ciz = true;
    }
  }
}
