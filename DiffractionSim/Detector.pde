class Detector {
  float distance;
  ArrayList<Wave> waves;
  color c;
  
  Detector(float distance, ArrayList<Wave> wave ) {
     this.distance = distance;
     this.waves = wave;
     c = waves.get(0).getColor();
  }

  float getIntensity(float x, float y, float t){
    float amp = 0;
    for (Wave w : waves) {
      amp += w.getAmp(x,y,t);
    }
    return amp * amp;
  }

  void display(){
    for (int y = 0; y < height; y++) {
      float intensity = getIntensity(width-10,y, millis()/1000.0);
      float brightness = 255 * intensity;
      stroke(brightness);
      fill(c);
      line(width-100,y,width,y);
    //for (int i = (int)distance; i < width; i++) {
      //for (int j = 0; j < height; j++) {
        //float intensity = getIntensity(x,y);
        //float brightness = intensity * 5 % 255;
        //stroke(brightness);
        //fill(c);
        //point(x,y);
//      }
    }
  }
}
