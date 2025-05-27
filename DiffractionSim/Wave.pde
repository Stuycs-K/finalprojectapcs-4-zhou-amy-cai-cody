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
  
  float getPhase(float x, float y, float time) {
    float distance = dist(source.x, source.y, x, y);
    float k = TWO_PI / wavelength;
    float omega = TWO_PI * frequency; 
    return k * distance - omega * time;
  }
  
  float getDispl(float x, float y, float time) {
    float phase = getPhase(x, y, time);
    return amplitude * sin(phase);
  }
  
  float getAmplitude(){}
}
