class Point {
  PVector position, velocity;
  float maxAmp;
  float amplitude;

  Point (float x, float y, float speed, float amplitude) {
    position = new PVector(x, y);
    velocity = new PVector(speed, 0);
    this.amplitude = amplitude;
    this.maxAmp = amplitude;
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

}
