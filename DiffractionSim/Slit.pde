class Slit {
  int numSlits;
  float slitDistance;
  
  Slit (int numSlits, float slitDistance) {
    this.numSlits = numSlits;
    this.slitDistance = slitDistance;
  }

  Source generateSource(float x, float y){
    return new Source(x, y);
  }
  
  void display(){
     if (MODE == SINGLE_SLIT) {
        rectMode(CORNER);
        fill(196, 164, 132);
        rect(width/2, 0, width/2 + 10, height/2-50);
        rect(width/2, height/2+50, width/2 + 10, height);
     }
  }

}
