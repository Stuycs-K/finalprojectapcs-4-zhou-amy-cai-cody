class Point {
  float xPos, yPos;
  float maxAmplitude, amplitude;
  float wavelength;
  color c;
  

  Point (float x, float y, float amplitude, float wavelength) {
    this.xPos = x;
    this.yPos = y;
    this.amplitude = amplitude;
    this.maxAmplitude = amplitude;
    this.wavelength = wavelength;
    float r = 0;
    float g = 0;
    float b = 0;
    if (wavelength >= 380 && wavelength < 440) {
      r = -(wavelength - 440) / (440 - 380);
      g = 0.0;
      b = 1.0;
    } else if (wavelength >= 440 && wavelength < 490) {
      r = 0.0;
      g = (wavelength - 440) / (490 - 440);
      b = 1.0;
    } else if (wavelength >= 490 && wavelength < 510) {
      r = 0.0;
      g = 1.0;
      b = -(wavelength - 510) / (510 - 490);
    } else if (wavelength >= 510 && wavelength < 580) {
      r = (wavelength - 510) / (580 - 510);
      g = 1.0;
      b = 0.0;
    } else if (wavelength >= 580 && wavelength < 645) {
      r = 1.0;
      g = -(wavelength - 645) / (645 - 580);
      b = 0.0;
    } else if (wavelength >= 645 && wavelength <= 780) {
      r = 1.0;
      g = 0.0;
      b = 0.0;
    }
    c = color(r*255, g*255, b*255);
  }

  float getX() {
    return xPos;
  }

  float getY() {
    return yPos;
  }

  float getAmp() {
    return amplitude;
  }
  
  void setAmplitude(float amp) {
    this.amplitude = amp;
  }

  void display() {
     noStroke();
     fill(c);
     square(xPos, yPos, 10);
  }

}
