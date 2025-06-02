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
    for (int i = (int)distance; i < width; i++) {
      for (int j = 0; j < height; j++) {
        float intensity = getIntensity(x,y);
        float brightness = intensity * 5 % 255;
        stroke(brightness);
        fill(c);
        point(x,y);
      }
    }
  }
}
