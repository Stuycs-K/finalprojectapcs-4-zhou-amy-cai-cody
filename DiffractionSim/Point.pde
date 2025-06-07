class Point {
  float xPos, yPos;
  float maxAmp;
  float amplitude;
  color c;

  Point (float x, float y, float amplitude, color c) {
    this.xPos = x;
    this.yPos = y;
    this.amplitude = amplitude;
    this.maxAmp = amplitude;
    this.c = c;
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
     
  }

}
