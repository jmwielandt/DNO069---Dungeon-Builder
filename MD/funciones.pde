boolean det_block(float rnd, float prob){
  if (rnd <= prob){
    return true;
  } else{
    return false;
  }
}

long time_seed(){
  long result = (millis()
                + second() * 1000 
                + minute() * 60 * 1000
                + hour() * 3600 * 1000
                + day() * 24 * 3600 * 1000
                + month() * 31 * 24 * 3600 * 1000
                + year() * 12 * 31 * 24 + 3600 * 1000);
  return result;
}
