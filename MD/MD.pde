JSONObject config;

void settings(){
  config = loadJSONObject("config.json");
  size(config.getInt("tile") * config.getInt("screen_x"),
       config.getInt("tile") * config.getInt("screen_y"));
  
}

void setup(){
  noStroke();
  noSmooth();
  background(255);
  fill(0);
  //noLoop();
  
}

void draw(){
  background(255);
  noiseSeed(time_seed());
  int tile = config.getInt("tile");
  int w = config.getInt("screen_x");
  int max = 3;
  int min = -3;
  int x = 0;
  int y = 3;
  for (x = 0; x < w; x++){
    rect(x*tile, y*tile, tile, tile);
    y += floor((max - min + 1) * noise(x, y) + min);
    println(y);
  }
  delay(1000);
}
