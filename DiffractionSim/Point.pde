class Point {
  PVector position, velocity;
  float maxAmp;
  float amplitude;
  boolean offScreen;
  color c;

  Point (float x, float y, float speed, float amplitude, color c) {
    position = new PVector(x, y);
    velocity = new PVector(speed, 0);
    this.amplitude = amplitude;
    this.maxAmp = amplitude;
    this.c = c;
    offScreen = false;
  }

  void move() {
    position = PVector.add(position, velocity);
  }

  float getX() {
    return position.x;
  }

  float getY() {
    return position.y;
  }
  
  void checkOffScreen() {
    if (getX() > width || getX() < 0 || getY() > height || getY() < 0) {
      offScreen = true;
    }
  }

  float getAmp() {
    return amplitude;
  }
  
  void setAmplitude(float amp) {
    this.amplitude = amp;
  }


}
