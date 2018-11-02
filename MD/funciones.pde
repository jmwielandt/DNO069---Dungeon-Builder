void copeKeys(boolean state){
  for (int i=0; i < keys_check.length; i++){
    if (keys_check[i] == keyCode){
      keys_down[i] = state;
    }
  }
}

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
