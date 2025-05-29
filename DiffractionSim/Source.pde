class Source {
  float xpos, ypos;
  ArrayList<Wave> waves;
  
  Source (float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }
  
  // filler values for wave
  void generateWave(int type) {
    Wave wave = new Wave(xpos, ypos, 1, 1, 1, type);
    waves.add(wave);
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
