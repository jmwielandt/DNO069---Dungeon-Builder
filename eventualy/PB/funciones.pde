

boolean equals(boolean[] a, boolean[] b){
  if (a.length != b.length){
    return false;
  } else{
    boolean r = true;
    for (int i = 0; i < a.length; i++){
      r = r && (a[i] == b[i]);
    }
    return r;
  }
}

float prox_to_zero(float a, float b){
  if (a >= 0){
    return max(0, a - b);
  } else{
    return min(0, a + b);
  }
}
