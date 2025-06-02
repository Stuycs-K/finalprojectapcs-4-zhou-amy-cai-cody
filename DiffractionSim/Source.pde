class Source {
  float xpos, ypos;
  ArrayList<Wave> waves;
  int type = 0;
  
  Source (float xpos, float ypos, int type) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.waves = new ArrayList<Wave>();
    this.type = type;
  }
  
  // filler values for wave
  void generateWave() {
    Wave wave = new Wave(xpos, ypos, 1, 50, 1, type, millis()/1000.0);
    waves.add(wave);
  }
  
  void changeType () {
    type = (type + 1) % 2;
  }
  
  float getX() {
    return xpos; 
  }
  
  float getY() {
    return ypos; 
  }
  
  void display() {
    noFill();
    noStroke();
    circle(xpos, ypos, 10);
    for (Wave w: waves) {
      w.display(millis() / 1000.0);
    }
  }
  
}
