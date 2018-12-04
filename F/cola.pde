class Cola{
  int[] bloques = new int[MAXLENCOLABLOQUES];
  
  Cola(JSONArray aux){
    for (int i = 0; i < aux.size(); i++){
      this.bloques[i] = aux.getInt(i);
    }
  }
  
  int get(){
    return this.bloques[0];
  }
  
  int pop(){
    int aux = this.bloques[0];
    for (int i = 0; i < this.bloques.length - 1; i++){
      this.bloques[i] = this.bloques[i + 1];
    }
    this.bloques[4] = VOID_BLOCK;
    return aux;
  }
  
  void push(int id){
    for (int i = 0; i < this.bloques.length; i++){
      if (this.bloques[i] == VOID_BLOCK){
        this.bloques[i] = id;
        break;
      }
    }
  }
  
  int count(){
    int c = 0;
    for (int i = 0; i < this.bloques.length; i++){
      if (this.bloques[i] != VOID_BLOCK){
        c++;
      }
    }
    return c;
  }
}
