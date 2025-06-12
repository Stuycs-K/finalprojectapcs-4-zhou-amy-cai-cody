class Detector {
  float distance;
  ArrayList<Wave> waves;
  color c;
  Detector (float distance, color c, ArrayList<Wave> waves) {
    this.distance = distance;
    this.c = c;
    this.waves = waves;
  }

  float getIntensity(float y){
    float amp = 0;
    for (int i = waves.size()-1; i>= 0; i--) {
      if (!waves.get(i).active) {
        waves.remove(i);
      }
    }
    for (Wave w : waves) {
      if (!w.active) continue;
      amp += w.getAmp(distance,y);
      //println(amp);
    }
    if (Float.isNaN(amp)) return 0;
    return amp * amp;
  }
  
  boolean isActive () {
    for (Wave w : waves) {
      for (Point p : w.points) {
        if (p.getX() >= distance - 50) {
          return true;
        }
      }
    }
    return false;
  }
  
  void display() {
    if (!isActive()) return;
    float maxIntensity = 0;
    for (int y = 0; y < height; y+=10) {
      float intensity = getIntensity(y);
      if (intensity > maxIntensity) {
        maxIntensity = intensity;
      }
    }
    for (int y = 0; y < height; y+=1) {
      float intensity = getIntensity(y);
      strokeWeight(5);
      float brightness = map(intensity,0,maxIntensity,0,255);
      stroke (c, brightness*0.90);
      line(distance-50,y,distance,y);
    }
  }
}
