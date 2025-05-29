class Source {
  float xpos, ypos;
  
  Source (float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }
  
  Wave generateWave() {
    
  }
  
  float getX() {
    return xpos; 
  }
  
  float getY() {
    return ypos; 
  }
  
  void display() {
    fill(0, 255, 255);
    noStroke();
    circle(xpos, ypos, 10);
  }
  
}
