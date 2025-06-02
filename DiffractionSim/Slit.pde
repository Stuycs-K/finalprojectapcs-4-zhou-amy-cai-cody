class Slit {
  int numSlits;
  float slitDistance;

  Slit (int numSlits, float slitDistance) {
    this.numSlits = numSlits;
    this.slitDistance = slitDistance;
  }

  Source generateSource(float x, float y, int type){
    return new Source(x, y, type);
  }

  void display(){
     if (MODE == SINGLE_SLIT) {
        rectMode(CORNER);
        noStroke();
        fill(196, 164, 132);
        rect(width/2.5, 0, 20, height/2-10);
        rect(width/2.5, height/2+10, 20, height);
     }
     if (MODE == DOUBLE_SLIT) {
       noStroke();
       fill(196,164,132);
       rectMode(CORNER);
       rect(width/2.5, 0,20,height/2-75);
       rect(width/2.5, height/2-35,20,60);
       rect(width/2.5, height/2+75,20,height/2-75);
     }
  }

}
