class Wave {
  PVector position, velocity;
  float wavelength;
  float speed;
  float amplitude;
  float maxAmplitude;
  float frequency;
  int WAVE_TYPE;
  int PLANAR = 0;
  int SPHERICAL = 1;
  float distance = 0;
  color c;

  Wave (float x, float y, float wavelength, float speed, float amplitude, int type) {
    this.wavelength = wavelength;
    this.speed = speed;
    this.maxAmplitude = amplitude;
    this.amplitude = amplitude;
    frequency = speed / wavelength;
    position = new PVector(x, y);
    velocity = new PVector(speed, speed);
    WAVE_TYPE = type;
    //code for wavelength --> hex
    float r = 0.0;
    float g = 0.0;
    float b = 0.0;
    float w = wavelength;
    if (380 <= w && w < 400) {
    	r = -(w-440) / (440-380);
    	b = 1.0;
    }
    else if (w < 490) {
    	g = (w-440) / (490-440);
    	b = 1.0;
    }
    else if (w < 510) {
    	g = 1.0;
    	b = -(w-510)/(510-490);
    }
    else if (w < 580) {
    	r = (w-510) / (580-510);
    	g = 1.0;
    }
    else {
    	r = 1.0;
    }
    c = color(r,g,b);
  }
  color getColor() {
  	return c;
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

  void setAmp(float amp) {
  	amplitude = amp;
  }

  void display(float sourceX, float sourceY, float distance) {
    fill(255);
    stroke(c, amplitude/maxAmplitude);
    if (WAVE_TYPE == PLANAR) {
      line(position.x, 0, position.x, height);
    }
    if (WAVE_TYPE == SPHERICAL) {
    
      circle(sourceX, sourceY, distance);
    }
  }

}
