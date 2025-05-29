class Source {
  float xpos
  float ypos
  
  Source (float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }
  
  Wave generateWave() {
     
  }
  
  void display() {
    fill(0, 255, 255);
    noStroke();
    circle(xpos, ypos, 10);
  }
  
}
