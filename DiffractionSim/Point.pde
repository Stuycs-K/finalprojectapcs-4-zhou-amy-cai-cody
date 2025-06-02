class Point {
  float x;
  float y;
  float amplitude;
  color c;
  Point (int x, int y, float amplitude, color c) {
    this.x = x;
    this.y = y;
    this.amplitude = amplitude;
    this.c = c;
  }
  void display() {
    float intensity = amplitude * amplitude;
    float brightness = intensity * 255;
    fill (c, brightness);
    circle(x,y,4);
  }
}
