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
        noStroke();
        rect(width/3, 0, 20, height/2-10);
        rect(width/3, height/2+10, 20, height);
     }
  }

}
