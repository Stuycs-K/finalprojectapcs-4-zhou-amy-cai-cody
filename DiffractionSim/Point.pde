class Point {
  PVector position, velocity;
  float amplitude;
  
  Point (float x, float y, float speed, float amplitude) {
    position = new PVector(x, y);
    velocity = new PVector(speed, 0);
    this.amplitude = amplitude;
  }
  
  void move() {
    position = PVector.add(position, velocity);
  }
  
  float getPosition() {
    return position.x; 
  }
  
  void display() {
    fill(0, 0, 255);
    noStroke();
    circle(position.x, position.y, 10);
  }
  
}
