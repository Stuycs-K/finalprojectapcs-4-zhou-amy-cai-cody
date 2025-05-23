class Wave {
  PVector source;
  float wavelength;
  float frequency;
  float speed;
  float amplitude;
  
  Wave (PVector source, float wavelength, float speed, float amplitude) {
    this.source = source;
    this.wavelength = wavelength;
    this.speed = speed;
    this.amplitude = amplitude;
    frequency = speed / wavelength;
  }
  
  float getPhase(float x, float y) {
  }
  
  float getAmplitude(float x, float y) {
  }
}
