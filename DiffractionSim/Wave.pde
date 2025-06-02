class Wave {
  PVector position, velocity, originalPos;
  float wavelength;
  float speed;
  float amplitude;
  float maxAmplitude;
  float frequency;
  int WAVE_TYPE;
  static final int PLANAR = 0;
  static final int SPHERICAL = 1;
  float distance = 0;
  color c;
  float time;

  Wave (float x, float y, float wavelength, float speed, float amplitude, int type, float t) {
    this.wavelength = wavelength;
    this.speed = speed;
    this.maxAmplitude = amplitude;
    this.amplitude = amplitude;
    frequency = speed / wavelength;
    position = new PVector(x, y);
    originalPos = new PVector(x,y);
    velocity = new PVector(1, 0);
    WAVE_TYPE = type;
    this.time = t;
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
    c = color(r*255,g*255,b*255);
  }
  color getColor() {
  	return c;
  }
  // in code, treat like a ray; visually, it will be a planar/spherical wave
  void propagate(float t) {
    if (WAVE_TYPE == PLANAR) {
      position = PVector.add(originalPos, PVector.mult(velocity, t-time));
    }
    else {
     position = PVector.add(position, velocity);
     distance += velocity.mag();
    }
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
    if (WAVE_TYPE == PLANAR) {
      position = PVector.add(originalPos, PVector.mult(velocity,t-time));
      return amplitude * sin(getPhase(x,y) - frequency * (t-time));
    }
  	else {
      float r = dist(x,y,originalPos.x, originalPos.y);
      float amp = amplitude / max(1,r);
      return amp * sin(getPhase(x,y) - frequency * (t-time));
    }
  }
  
  void changeType() {
    WAVE_TYPE++;
    WAVE_TYPE%=2;
  }

  void setAmp(float amp) {
  	amplitude = amp;
  }

  void display(float t) {
    propagate(t);
    noFill();
    stroke(c, amplitude/maxAmplitude);
    if (WAVE_TYPE == PLANAR) {
      float xPos = originalPos.x + velocity.x * (t-time);
      line(xPos, 0, xPos, height);
    }
    if (WAVE_TYPE == SPHERICAL) {
      float r = velocity.mag() * (t-time);
      circle(originalPos.x, originalPos.y, r);
    }
  }
  
  boolean hitSlit() {
    return (position.x >= width /2 && position.x < width/2 + 20);
  }

}
