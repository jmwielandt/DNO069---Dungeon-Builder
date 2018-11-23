float prox_to_zero(float a, float b){
  if (a >= 0){
    return max(0, a - b);
  } else{
    return min(0, a + b);
  }
}
