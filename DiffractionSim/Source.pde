class Source {
  float xpos, ypos;
  int waveType;
  
  Source (float xpos, float ypos, int waveType) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.waveType = waveType;
  }
  
  // filler values for wave
  Wave generateWave() {
    Wave wave = new Wave(getX(), waveType);
    return wave;
  }
  
  void changeWaveType () {
    waveType = (waveType + 1) % 2;
  }
  
  float getX() {
    return xpos; 
  }
  
  float getY() {
    return ypos; 
  }
  
}
