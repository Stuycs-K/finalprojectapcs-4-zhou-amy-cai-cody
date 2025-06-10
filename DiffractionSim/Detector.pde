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
    for (Wave w : waves) {
      amp += w.getAmp(distance,y);
      //println(amp);
    }
    return amp * amp;
  }
  boolean isActive () {
    for (Wave w : waves) {
      println(w.position.x);
      //println(distance);
      if (abs(w.position.x - distance) < 100) {
        //println("hi");
        return true;
      }
    }
    return false;
  }
  void display() {
    if (!isActive()) return;
    float maxIntensity = 0;
    for (int y = 0; y < height; y+=2) {
      float intensity = getIntensity(y);
      if (intensity > maxIntensity) {
        maxIntensity = intensity;
      }
    }
    for (int y = 0; y < height; y+=2) {
      float intensity = getIntensity(y);
      strokeWeight(2);
      float brightness = map(intensity,0,maxIntensity,0,255);
      stroke (c, brightness);
      line(distance-50,y,distance,y);
    }
  }
}
//class Detector {
//  float distance;
//  ArrayList<Wave> waves;
//  color c;
  
//  Detector(float distance, ArrayList<Wave> wave ) {
//     this.distance = distance;
//     this.waves = wave;
//     c = waves.get(0).getColor();
//  }

//  float getIntensity(float x, float y, float t){
//    float amp = 0;
//    for (Wave w : waves) {
//      amp += w.getAmp(x,y,t);
//    }
//    return amp * amp;
//  }

//  void display(){
//    for (int y = 0; y < height; y+=2) {
//      float intensity = getIntensity(distance,y, millis()/1000.0);
//      float brightness = intensity * 255;
//      stroke(c,brightness);
//      line(width-100,y,width,y);
//    }
//  }
//}
