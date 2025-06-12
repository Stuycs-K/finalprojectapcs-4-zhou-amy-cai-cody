class Source {
  float xpos, ypos;
  int waveType;

  Source (float xpos, float ypos, int waveType) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.waveType = waveType;
  }

  Wave generateWave(float x, float y, float wavelength, float amp) {
    Wave wave = new Wave(xpos, waveType, x, y, wavelength, amp);
    return wave;
  }

}
