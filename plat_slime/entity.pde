class Entity{
  float x;
  float y;
  int w;
  int h;
  color col = color(255, 0, 0);
  boolean cayendo = false;
  boolean horiz = true;
  boolean vert = false;
  float speed_x = 0;
  float speed_y = 0;
  
  Entity(float x, float y, int w, int h){
    this.x = x*map.tile_s;
    this.y = y*map.tile_s;
    this.w = w;
    this.h = h;
  }
  
  void auto_draw(){
    fill(this.col);
    rect(this.x, this.y, this.w, this.h);
  }
  
  void hay_caida(){
    int[] aux1 = this.bot_left();
    int[] aux2 = this.bot_right();
    if (aux1[1] > map.h || map.grid[aux1[0]][aux1[1]] == 1 || map.grid[aux2[0]][aux2[1]] == 1){
      this.cayendo = false;
    } else{
      this.cayendo = true;
    }
  }
  
  void move(){
    if (this.speed_x < 0){
      this.x = max(0, this.x + this.speed_x);
    } else{
      this.x = min(map.w * map.tile_s - this.w, this.x + this.speed_x);
    }
    
    if (this.speed_y < 0){
      this.y = max(0, this.y + this.speed_y);
    } else{
      this.y = min(map.h * map.tile_s - this.h, this.y + this.speed_y);
    }
  }
  
  int[] bot_left_d(){
    int[] aux = {(int)(this.x % map.tile_s), (int)((this.y + this.h - 0.01) % map.tile_s)};
    return aux;
  }
  
  int[] bot_right_d(){
    int[] aux = {(int)((this.x + this.w - 0.01) % map.tile_s), (int)((this.y + this.h - 0.01) % map.tile_s)};
    return aux;
  }
  
  int[] bot_left(){
    int[] aux = {(int)(this.x % map.tile_s), (int)((this.y + this.h) % map.tile_s)};
    return aux;
  }
  
  int[] bot_right(){
    int[] aux = {(int)((this.x + this.w - 0.01) % map.tile_s), (int)((this.y + this.h) % map.tile_s)};
    return aux;
  }
  
  int[] top_left(){
    int[] aux = {(int)(this.x % map.tile_s), (int)(this.y % map.tile_s)};
    return aux;
  }
  
  int[] top_right(){
    int[] aux = {(int)((this.x + this.w - 0.01) % map.tile_s), (int)(this.y % map.tile_s)};
    return aux;
  }
}



class HitBox{
  float x;
  float y;
  int w;
  int h;
}
