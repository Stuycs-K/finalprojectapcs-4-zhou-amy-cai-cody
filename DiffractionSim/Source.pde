class Source {
  float xpos, ypos;
  int waveType;
  
  Source (float xpos, float ypos, int waveType) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.waveType = waveType;
  }
  
  // filler values for wave
  Wave generateWave(float x, float y) {
    Wave wave = new Wave(xpos, waveType, x, y, 450);
    return wave;
  }
  
}
