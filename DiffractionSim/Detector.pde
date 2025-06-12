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
    int count = 0;
    for (int i = waves.size() - 1; i >= 0; i--) {
      if (!waves.get(i).active) {
        waves.remove(i);
      }
    }
    for (Wave w : waves) {
      if (!w.active) continue;
      float amp = w.getAmp(distance - 1, y);
      totalAmp += amp;
      count++;
    }
    if (count == 0) return 0;
    return sq(totalAmp / count);
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
    float[] intensities = new float[height];
    float maxIntensity = 0;
    for (int y = 0; y < height; y += 1) {
      float intensity = getIntensity(y);
      intensities[y] = intensity;
      if (intensity > maxIntensity) {
        maxIntensity = intensity;
      }
    }
    for (int y = 0; y < height; y += 1) {
      float brightness = map(intensities[y], 0, maxIntensity, 0, 255);
      strokeWeight(5);
      stroke(c, brightness * 0.9);
      line(distance - 50, y, distance, y);
    }
  }
}
