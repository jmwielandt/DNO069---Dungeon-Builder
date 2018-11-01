int det_block(float rnd, int[] posibs,float[] probs){
  for (int i=0; i < probs.length; i++){
    if (rnd <= probs[i]){
      return posibs[i];
    }
  }
  return -1;
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
