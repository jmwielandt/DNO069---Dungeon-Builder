class Jugador extends HitBox
{
  color me = color(0, 255, 200);
  
  Jugador(int x, int y, int w, int h)
  {
    super(x * tile, y * tile, w, h);
  }
  
  void draw()
  {
    fill(this.me);
    rect(this.x, this.y, this.w, this.h);
  }
}

class HitBox
{
  float x;
  float y;
  int w;
  int h;
  float vel_x = 0;
  float vel_y = 0;
  
  HitBox(float x, float y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void move()
  {
    // colisión bordes del mundo
    if (this.vel_x < 0 && floor(this.x / tile) == 0)
    {  // borde izquierdo
      this.vel_x = max(this.vel_x, 0 - this.x);
    } 
    
    else if (this.vel_x > 0 && floor(this.x / tile) == jue.w - 1)
    {  // borde derecho
      this.vel_x = min(this.vel_x, tile * jue.w - (this.x + this.w));
    }
    
    
    if (this.vel_y < 0 && floor(this.y / tile) == 0)
    {  // arriba
      this.vel_y = max(this.vel_y, 0 - this.y);
    } 
    
    else if (this.vel_y > 0 && floor(this.y / tile) == jue.h - 1)
    {  // abajo
      this.vel_y = min(this.vel_y, tile * jue.h - (this.y + this.h));
    }
    
    // colisión contra bloques
    //println(this.vel_x, this.vel_y);
    int[][] pos = this.coords(this.x, this.y);
    
    if (this.vel_x != 0 && this.vel_y != 0){
      // después
      int[][] npos = this.coords(this.x + this.vel_x, this.y + this.vel_y);
      
      if (this.vel_x < 0 && this.vel_y < 0){
        if (pos[0][0] == 0 || pos[0][1] == 0){
        } else{
          int aux1 = jue.grilla[pos[0][0] - 1][pos[0][1]];
          int aux2 = jue.grilla[pos[2][0] - 1][pos[2][1]];
          int aux3 = jue.grilla[pos[0][0]][pos[0][1] - 1];
          int aux4 = jue.grilla[pos[1][0]][pos[1][1] - 1];
          int aux5 = jue.grilla[pos[0][0] - 1][pos[0][1] - 1];
          
          if (aux1 == 0 && aux2 == 0 && aux3 == 0 && aux4 == 0 && aux5 == 1 && pos[0][0] != npos[0][0] && pos[0][1] != npos[0][1]){
            this.vel_y = max(this.vel_y, pos[0][1] * tile - this.y);
            println("desvío!1");
          }
        }
      } else if (this.vel_x > 0 && this.vel_y < 0){
        if (pos[1][0] == jue.w - 1 || pos[0][1] == 0){
        } else{
          int aux1 = jue.grilla[pos[1][0] + 1][pos[1][1]];
          int aux2 = jue.grilla[pos[3][0] + 1][pos[3][1]];
          int aux3 = jue.grilla[pos[0][0]][pos[0][1] - 1];
          int aux4 = jue.grilla[pos[1][0]][pos[1][1] - 1];
          int aux5 = jue.grilla[pos[1][0]  + 1][pos[1][1] - 1];
          if (aux1 == 0 && aux2 == 0 && aux3 == 0 && aux4 == 0 && aux5 == 1 && pos[1][0] != npos[1][0] && pos[1][1] != npos[1][1]){
            this.vel_y = max(this.vel_y, pos[0][1] * tile - this.y);
            println("desvío2!");
          }
        }
          
      } else if (this.vel_x < 0 && this.vel_y > 0){
        if (pos[0][0] == 0 || pos[2][1] == jue.h - 1){
        } else{
          //println(pos[2][0], pos[2][1], jue.h);
          int aux1 = jue.grilla[pos[0][0] - 1][pos[0][1]];
          int aux2 = jue.grilla[pos[2][0] - 1][pos[2][1]];
          int aux3 = jue.grilla[pos[2][0]][pos[2][1] + 1];
          int aux4 = jue.grilla[pos[3][0]][pos[3][1] + 1];
          int aux5 = jue.grilla[pos[2][0] - 1][pos[2][1] + 1];
          if(aux1 == 0 && aux2 == 0 && aux3 == 0 && aux4 == 0 && aux5 == 1 && pos[2][0] != npos[2][0] && pos[2][1] != npos[2][1]){
            this.vel_y = min(this.vel_y, (pos[2][1] + 1) * tile - (this.y + this.h));
            println("\t desvío 3!");
          }
        }
      } else if (this.vel_x > 0 && this.vel_y > 0){
        if (pos[1][0] == jue.w - 1 || pos[2][1] == jue.h - 1){
        } else{
          int aux1 = jue.grilla[pos[1][0] + 1][pos[1][1]];
          int aux2 = jue.grilla[pos[3][0] + 1][pos[3][1]];
          int aux3 = jue.grilla[pos[2][0]][pos[2][1] + 1];
          int aux4 = jue.grilla[pos[3][0]][pos[3][1] + 1];
          int aux5 = jue.grilla[pos[3][0] + 1][pos[3][1] + 1];
          if (aux1 == 0 && aux2 == 0 && aux3 == 0 && aux4 == 0 && aux5 == 1 && pos[3][0] != npos[3][0] && pos[3][1] != npos[3][1]){
            this.vel_y = min(this.vel_y, (pos[2][1] + 1) * tile - (this.y + this.h));
            println("\t\t\tdesvío 4");
          }
        }
      }  // fin
      
      
      
    } /*else*/ 
    
    if (this.vel_x != 0){
      if (this.vel_x < 0){
        if (pos[0][0] == 0){
          // pass
        } else{
            int aux1 = jue.grilla[pos[0][0] - 1][pos[0][1]];
            int aux2 = jue.grilla[pos[2][0] - 1][pos[2][1]];
            if (aux1 == 1 || aux2 == 1){
              this.vel_x = max(this.vel_x, pos[0][0] * tile - this.x);
            }
          }
        } else if (this.vel_x > 0){
          if (pos[1][0] == jue.w - 1){
            //pass
          } else{
            int aux1 = jue.grilla[pos[1][0] + 1][pos[1][1]];
            int aux2 = jue.grilla[pos[3][0] + 1][pos[3][1]];
            if (aux1 == 1 || aux2 == 1){
              this.vel_x = min(this.vel_x, (pos[1][0] + 1) * tile - (this.x + this.w));
            }
          }
        }
      } /*else*/ 
      
      if (this.vel_y != 0){
        if (this.vel_y < 0){
          if (pos[0][1] == 0){
          // pass
        } else{
            int aux1 = jue.grilla[pos[0][0]][pos[0][1] - 1];
            int aux2 = jue.grilla[pos[1][0]][pos[1][1] - 1];
            if (aux1 == 1 || aux2 == 1){
              this.vel_y = max(this.vel_y, pos[0][1] * tile - this.y);
            }
          }
        } else if (this.vel_y > 0){
          if (pos[2][1] == jue.h - 1){
            //pass
          } else{
            int aux1 = jue.grilla[pos[2][0]][pos[2][1] + 1];
            int aux2 = jue.grilla[pos[3][0]][pos[3][1] + 1];
            if (aux1 == 1 || aux2 == 1){
              this.vel_y = min(this.vel_y, (pos[2][1] + 1) * tile - (this.y + this.h));
            }
          }
        }
      }

    this.x += this.vel_x;
    this.y += this.vel_y;
    
    this.vel_x = prox_to_zero(this.vel_x, ROCE);
    this.vel_y = prox_to_zero(this.vel_y, ROCE);
    
    // Controlador de los bordes del mapa
    
    if (this.x < 0)
    {
      this.x = 0;
    } 
    else if (this.x > jue.w * tile - this.w)
    {
      this.x = jue.w * tile - this.w;
    }
    
    if (this.y < 0)
    {
      this.y = 0;
    } 
    else if (this.y > jue.h * tile - this.h)
    {
      this.y = jue.h * tile - this.h;
    }
  }
  
  int[][] coords(float x, float y)
  {
    int[][] pos = new int[4][2];
    pos[0][0] = floor(x/tile);
    pos[0][1] = floor(y/tile);
    
    pos[1][0] = floor((x + this.w - 0.01)/tile);
    pos[1][1] = floor(y/tile);
    
    pos[2][0] = floor(x/tile);
    pos[2][1] = floor((y + this.h - 0.01)/tile);
    
    pos[3][0] = floor((x + this.w - 0.01)/tile);
    pos[3][1] = floor((y + this.h - 0.01)/tile);
    
    return pos;
  }
  
}
