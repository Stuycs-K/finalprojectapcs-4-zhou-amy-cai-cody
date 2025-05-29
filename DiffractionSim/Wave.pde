class Wave {
  PVector position, velocity;
  float wavelength;
  float frequency;
  float speed;
  float amplitude;

  Wave (float x, float y, float wavelength, float speed, float amplitude) {
    this.wavelength = wavelength;
    this.speed = speed;
    this.amplitude = amplitude;
    frequency = speed / wavelength;
    position = new PVector(x, y);
    velocity = new PVector(speed, speed);
  }

  // in code, treat like a ray; visually, it will be a spherical wave
  void propagate() {
     position = new PVector(position, velocity);
  }

  void display(float sourceX, float sourceY, float distance) {
    fill(255);
    circle(sourceX, sourceY, distance);
  }

}
