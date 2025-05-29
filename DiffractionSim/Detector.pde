class Detector {
  float[][] data;
  float distance;
  ArrayList<Wave> waves;
  
  float getIntensity(int x, int y){
     float phase = waves.get(0).getPhase() - waves.get(1).getPhase();
     float wavelength = waves.get(0).wavelength;
     if (Math.abs(phase/wavelength - (int)(phase/wavelength)) < 0.25) {
       Wave newWave = Interference.interfere(waves.get(0), waves.get(1), x, y);
       return newWave.amplitude * newWave.amplitude;
     }
     return 0.0;
  }
  
  void display(){
  
  }
  
  
}
