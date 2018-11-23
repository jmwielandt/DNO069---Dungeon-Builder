class ScreenMap{
  int dx;
  int dy;
  int w;
  int h;
  int tile_s = 32;
  int[][] grid;
  
  ScreenMap(int w, int h){
    this.w = w;
    this.h = h;
    this.dx = 0;
    this.dy = 0;
    this.grid = new int[w][h];
    JSONArray aux = loadJSONArray("nivel.json");
    for (int i=0; i<w; i++){
      for (int j=0; j<h; j++){
        this.grid[i][j] = aux.getJSONArray(j).getInt(i);
      }
    }
  }
  
  
  void auto_draw(){
    for (int i=0; i<this.w; i++){
      for (int j=0; j<this.h; j++){
        if (this.grid[i][j] == 0){
          fill(255);
        } else{
          fill(0);
        }
        rect(i * this.tile_s - this.dx, j * this.tile_s - this.dy, this.tile_s, this.tile_s);
      }
    }
  }
  
}
