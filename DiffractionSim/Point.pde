class Point {
  PVector position, velocity;
  float maxAmp;
  float amplitude;
  color c;

  Point (float x, float y, float speed, float amplitude, color c) {
    position = new PVector(x, y);
    velocity = new PVector(speed, 0);
    this.amplitude = amplitude;
    this.maxAmp = amplitude;
    this.c = c;
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

  float getAmp() {
    return amplitude;
  }

  void setAmplitude(float amp) {
    this.amplitude = amp;
  }


}
