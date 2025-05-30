class Wave {
  PVector position, velocity;
  float wavelength;
  float speed;
  float amplitude;
  float frequency;
  int WAVE_TYPE;
  int PLANAR = 0;
  int SPHERICAL = 1;
  float distance = 0;

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
     distance += position.mag();
  }

  float getDist() {
  	return distance;
  }

  float getPhase(float x, float y) {
  	float r = dist(x,y,position.x, position.y);
  	float k = TWO_PI / wavelength;
  	return k * r;
  }

  float getAmp(float x, float y, float t) {
  	return amplitude * sin (getPhase(x,y) - frequency * t);
  }
  
  void changeType() {
    WAVE_TYPE++;
    WAVE_TYPE%=2;
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
