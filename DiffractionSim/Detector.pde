class Detector {
  float distance;
  ArrayList<Wave> waves;
  color c;
  
  Detector(float distance, ArrayList<Wave> wave ) {
     this.distance = distance;
     this.waves = waves;
     c = waves.get(0).getColor();
  }

  float getIntensity(int x, int y){
    float amp = 0;
    for (Wave w : waves) {
      amp += w.getAmp(x,y,millis() / 1000.0);
    }
    return amp * amp;
  }

  void display(int x, int y){
  	float intensity = getIntensity(x, y);
  	if (intensity != 0) {
  		fill(c);
  		rect(x, y, x+20, y+30);
  	}
  }

}
