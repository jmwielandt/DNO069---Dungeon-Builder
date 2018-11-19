class MapBox{
  int x = 0;  // punto de referencia para la cámara!
  int y = 0;
  int sxv;  // tamaño cuadro del mapa
  int syv;
  int delx;  // desplazamiento del cuadro del mapa dentro de la ventana
  int dely;
  int tile_s;  // tamaño de un tile
  Mapa mapa;  // instancia del mapa
  
  MapBox(int _sxv, int _syv, int _del_x, int _del_y, int _tile_s, Mapa _map){
    sxv = _sxv;
    syv = _syv;
    delx = _del_x;
    dely = _del_y;
    tile_s = _tile_s;
    mapa = _map;
  }
  
  void auto_draw(){
    for (int i=max(0, floor(x / tile_s)); i<min(ceil((x + sxv) / tile_s), mapa.wid); i++){
      for (int j=max(0, floor(y/tile_s)); j<min(ceil((y + syv) / tile_s), mapa.hei); j++){
        fill(colores[mapa.grilla[i][j]]);
        rect(delx + i * tile_s - x, dely + j * tile_s - y, tile_s, tile_s);
      }
    }
  }
  
  void auto_update(){
    if  (keys_down[0]){
      x = max(0, x - speed);
    } else if (keys_down[1]){
      y = min(mapa.hei * tile_s - syv, y + speed);
    } else if (keys_down[2]){
      x = min(mapa.wid * tile_s - sxv, x + speed);
    } else if (keys_down[3]){
      y = max(0, y - speed);
    }
    if (mapa.wid * tile_s < sxv){
      x = 0;
    }
    if (mapa.hei * tile_s < syv){
      y = 0;
    }
  }
  
  void its_me(int _x, int _y){
    if (_x >= delx && x < delx + sxv && _y >= dely && _y < dely + syv){
      mapa.grilla[(_x - delx)/tile_s][(_y - dely)/tile_s] += 1;
    }
  }
  
}
