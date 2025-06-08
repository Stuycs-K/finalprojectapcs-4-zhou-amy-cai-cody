class Slit {
  int numSlits;
  float slitDistance;

  Slit (int numSlits, float slitDistance) {
    this.numSlits = numSlits;
    this.slitDistance = slitDistance;
  }

  void display(){
     if (MODE == SINGLE_SLIT) {
        noStroke();
        fill(196, 164, 132);
        rectMode(CORNER);
        rect(width/2, 0, 20, height/2-10);
        rect(width/2, height/2+10, 20, height/2-10);
     }
     if (MODE == DOUBLE_SLIT) {
       noStroke();
       fill(196,164,132);
       rectMode(CORNER);
       rect(width/2, 0,20,height/2-75);
       rect(width/2, height/2-35,20,60);
       rect(width/2, height/2+75,20,height/2-75);
     }
  }

}
