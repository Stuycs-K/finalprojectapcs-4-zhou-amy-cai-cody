//class Detector {
//  float distance; 
//  ArrayList<Wave> waves;
//  color c;
  
//  float getIntensity(float x, float y, float t){
//    float amp = 0;
//    for (Wave w : waves) {
//      for (Point p : w.points) {
//        amp += p.getAmp();
//      }
//    }
//    return amp * amp;
//  }
//  void display() {
//    for (int y = 0; y < height; y+=2) {
//      float intensity = getIntensity(distance,y, millis()/1000.0);
//      float brightness = intensity * 255;
//      stroke(c,brightness);
//      line(width-100,y,width,y);
//    }
//  }
//}
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
