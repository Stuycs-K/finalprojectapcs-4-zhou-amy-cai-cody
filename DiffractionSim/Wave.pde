class Wave {
  PVector position, velocity;
  float wavelength;
  float speed;
  float amplitude;
  static int WAVE_TYPE;
  static int PLANAR = 0;
  static int SPHERICAL = 1;

  Wave (float x, float y, float wavelength, float speed, float amplitude, int type) {
    this.wavelength = wavelength;
    this.speed = speed;
    this.amplitude = amplitude;
    frequency = speed / wavelength;
    position = new PVector(x, y);
    velocity = new PVector(speed, speed);
    WAVE_TYPE = type;
  }

  // in code, treat like a ray; visually, it will be a planar/spherical wave
  void propagate() {
     position = new PVector(position, velocity);
  }

  void display(float sourceX, float sourceY, float distance) {
    fill(255);
    stroke(0);
    if (WAVE_TYPE == PLANAR) {
      line(position.x, 0, position.x, height);
    }
    if (WAVE_TYPE == SPHERICAL) {
      circle(sourceX, sourceY, distance); 
    }
  }

}
