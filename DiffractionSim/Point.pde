class Point {
  float xPos, yPos;
  float maxAmplitude, amplitude;
  float wavelength;
  color c;
  int WAVE_TYPE;

  Point (float x, float y, float amplitude, float wavelength, int WAVE_TYPE) {
    this.xPos = x;
    this.yPos = y;
    this.amplitude = amplitude;
    this.maxAmplitude = amplitude;
    this.wavelength = wavelength;
    this.c = wavelengthToColor(wavelength);
    this.WAVE_TYPE = WAVE_TYPE;
  }
  
  color wavelengthToColor(float wavelength) {
     float r = 0;
    float g = 0;
    float b = 0;
    if (wavelength >= 380 && wavelength < 440) {
      r = -(wavelength - 440) / (440 - 380);
      g = 0.0;
      b = 1.0;
    } else if (wavelength >= 440 && wavelength < 490) {
      r = 0.0;
      g = (wavelength - 440) / (490 - 440);
      b = 1.0;
    } else if (wavelength >= 490 && wavelength < 510) {
      r = 0.0;
      g = 1.0;
      b = -(wavelength - 510) / (510 - 490);
    } else if (wavelength >= 510 && wavelength < 580) {
      r = (wavelength - 510) / (580 - 510);
      g = 1.0;
      b = 0.0;
    } else if (wavelength >= 580 && wavelength < 645) {
      r = 1.0;
      g = -(wavelength - 645) / (645 - 580);
      b = 0.0;
    } else if (wavelength >= 645 && wavelength <= 780) {
      r = 1.0;
      g = 0.0;
      b = 0.0;
    }
    return color(r*255, g*255, b*255);
  }

  float getX() {
    return xPos;
  }

  float getY() {
    return yPos;
  }

  float getAmp() {
    return amplitude;
  }
  
  void setAmplitude(float amp) {
    this.amplitude = amp;
  }
  
  void colorColumn(Point[][] points, int c, float wavelength) {
    for (int r = 0; r < points.length; r++) {
      points[c][r].c = wavelengthToColor(wavelength);
    }
  }
  
  void clearColumn(Point[][] points, int col) {
    for (int r = 0; r < points[0].length; r++) {
      points[col][r].c = color(0); 
    }
  }
  
  void switchColors(Point target) {
    color temp = this.c;
    this.c = target.c;
    target.c = temp;
  }
  
  void radiate(Point[][] points, int c, int r) {
    if (c < 0 || c >= points.length || r < 0 || r >= points[0].length || c == points.length - 1) {
      return;
    }
    int[][] directions = {{1, 0}, {1, -1}, {1, 1}};
    for (int[] direction : directions) {
      int nextC = c + direction[0];
      int nextR = r + direction[1];
      if (nextC >= 0 && nextC < points.length && nextR >= 0 && nextR < points[0].length) {
        if (points[nextC][nextR].c == color(0)) {
          points[c][r].switchColors(points[nextC][nextR]);
          points[nextC][nextR].radiate(points, nextC, nextR); 
        }
      }
    }
  }

  void display() {
     noStroke();
     fill(c);
     square(xPos, yPos, 5);
  }

}
