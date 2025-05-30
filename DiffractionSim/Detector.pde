class Detector {
  float[][] data;
  float distance;
  ArrayList<Wave> waves;
  color c;

  Detector() {
  	//Dan bruton's approximation for wavelength --> hex
  	float r = 0.0;
  	float g = 0.0;
  	float b = 0.0;
  	float wl = waves.get(0).wavelength;
  	if (380 <= w && w < 400) {
  		r = -(w - 440) / 440 -380);
  		g = 0.0;
  		b = 1.0;
  	}
  	else if (440 <= w && w < 490) {
  		r = 0.0;
  		g = (w - 440) / (490-440);
  		b = 1.0;
  	}
  	else if (490 < w < 510) {
  		r = 0.0;
  		g = 1.0;
  		b = -(w - 510) / (510 - 490);
  	}
  	else if (510 <= w && w < 580) {
  		r = (w - 510) / (580 - 510);
  		g = 1.0;
  		b = 0.0;
  	}
  	else {
  		r = 1.0;
  		g = 0.0;
  		b = 0.0;
  	}
  	c = (r, g, b);
  	fill(0);
  	rect(WIDTH - 100, 0, WIDTH-100, HEIGHT);
  }
  float getIntensity(int x, int y){
     float phase = waves.get(0).getDist() - waves.get(1).getDist();
     float wavelength = waves.get(0).wavelength;
     if (Math.abs(phase/wavelength - (int)(phase/wavelength)) < 0.25) {
       Wave newWave = Interference.interfere(waves.get(0), waves.get(1), x, y);
       return newWave.amplitude * newWave.amplitude;
     }
     return 0.0;
  }
  
  void display(int x, int y){
  	float intensity = getIntensity(x, y);
  	if (intensity != 0) {
  		fill(c);
  		rect(x, y, x+20, y+30);
  	}
  }
  
  
}
