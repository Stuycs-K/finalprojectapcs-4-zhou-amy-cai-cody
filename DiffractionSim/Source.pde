class Source {
  float xpos, ypos;
  int waveType;

  Source (float xpos, float ypos, int waveType) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.waveType = waveType;
  }

  // filler values for wave
  Wave generateWave(float wavelength) {
    Wave wave = new Wave(xpos, waveType, wavelength);
    return wave;
  }

}
