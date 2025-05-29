class Interference {
  ArrayList<Wave> waves;
  int width;
  int height;
  
  Wave interfere(Wave a, Wave b, int x, int time) {
    float amp = a.amplitude;
    float w = TWO_PI * a.frequency;
    float w = TWO_PI / a.wavelength;
    float phi = a.getPhase(x,y) - b.getPhase(x,y);
    return 2 * amp * Math.cos(phi / 2) * Math.sin(k * x - w * time + phi / 2);
  }
  float getIntensity(Wave a, Wave b, int x, int time) {
    return interfere(a,b,x,time).getIntensity()
  }
}
