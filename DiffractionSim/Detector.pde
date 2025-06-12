class Detector {
  float distance;
  ArrayList<Wave> waves;
  color c;

  Detector(float distance, color c, ArrayList<Wave> waves) {
    this.distance = distance;
    this.c = c;
    this.waves = waves;
  }

  float getIntensity(float y) {
    float totalAmp = 0;
    for (int i = waves.size() - 1; i >= 0; i--) {
      if (!waves.get(i).active) {
        waves.remove(i);
      }
    }
    for (Wave w : waves) {
      if (!w.active) continue;
      float amp = w.getAmp(distance, y);
      totalAmp += amp;
    }
    return totalAmp * totalAmp;
    //println(totalAmp);
    //if (count == 0) return 0;
    //float ans = totalAmp / count;
    //println(ans);
    //if (totalAmp >= 0) {
    //  //println(sq(a));
    //  return sq(totalAmp);
    //}
    //println(-sq(ans));
    //return -sq(totalAmp);
    //return sq(totalAmp);
  }

  boolean isActive() {
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
    stroke(255);
    strokeWeight(5);
    line(distance-50,0,distance-50,height);
    float maxIntensity = getIntensity(0);
    float minIntensity = getIntensity(0);
    for (int y = 0; y < height; y += 10) {
      float intensity = getIntensity(y);
      if (intensity > maxIntensity) {
        maxIntensity = intensity;
      }
      if (intensity < maxIntensity) {
        minIntensity = intensity;
      }
    }
    for (int y = 0; y < height; y += 1) {
      stroke(c, map(getIntensity(y), minIntensity, maxIntensity, 0, 1));
      line(distance - 50, y, distance, y);
    }
  }
}
