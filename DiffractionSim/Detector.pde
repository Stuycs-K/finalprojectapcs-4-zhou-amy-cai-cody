class Detector {
  float[][] data;
  float distance;
  ArrayList<Wave> waves;
  color c;
  
  Detector() {
     
  }

  float getIntensity(int x, int y){
     float phase = waves.get(0).getDist() - waves.get(1).getDist();
     float wavelength = waves.get(0).wavelength;
     if (Math.abs(phase/wavelength - (int)(phase/wavelength)) < 0.25) {
       Wave newWave = Interference.getAmp(waves.get(0), waves.get(1), x, y);
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
