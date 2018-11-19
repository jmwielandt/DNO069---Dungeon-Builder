void updater(){
  mw.auto_update();
}

void copeKeys(boolean state){
  for (int i=0; i < keys_check.length; i++){
    if (keys_check[i] == keyCode){
      keys_down[i] = state;
    }
  }
}
