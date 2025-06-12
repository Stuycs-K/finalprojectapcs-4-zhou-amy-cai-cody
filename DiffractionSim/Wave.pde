import java.util.*;

class Wave {
  int WAVE_TYPE;
  PVector position;
  static final int PLANAR = 0;
  static final int SPHERICAL = 1;
  ArrayList<Point> points;
  PVector originalPos;
  float wavelength;
  float amp;
  color c;
  float speed = 10.0;
  boolean active = true;

  Wave(float startPos, int type, float wavelength, float x, float y){
    points = new ArrayList<Point>();
    position = new PVector(x, y);
    amp = 10;
    this.wavelength = wavelength;
    c = wavelengthToColor(wavelength);
    for (int i = 0; i < height; i+=10) {
      Point point = new Point(startPos, i, speed, 10, c);
      points.add(point);
    }
    WAVE_TYPE = type;
    originalPos = new PVector(startPos, 0);
    WAVE_TYPE = type;
  }

  void active() {
    if (WAVE_TYPE == PLANAR) {
      boolean allOff = true;
      for (Point p : points) {
        if (p.getX() < width) {
          allOff = false;
        }
      }
      active = !allOff;
    }
    else {
      boolean allOff = true;
      for (Point p : points) {
        if (p.getX() >= 0 && p.getX() <= width && p.getY() >= 0 && p.getY() < height) {
          allOff = false;
        }
      }
      active = !allOff;
    }
  }
  ArrayList<Point> getPoints() {
    return points;
  }
  
  void updateWavelength(float newWavelength) {
    this.wavelength = newWavelength;

    float w = newWavelength;
    float r = 0;
    float g = 0;
    float b = 0;

    if (380 <= w && w < 400) {
      r = 0.3 * (-(w - 440) / (440 - 380));
      b = 1.0;
    }
    else if (w < 490) {
      g = (w-440) / (490-440);
      b = 1.0;
    }
    else if (w < 510) {
      g = 1.0;
      b = -(w-510)/(510-490);
    }
    else if (w < 580) {
      r = (w-510) / (580-510);
      g = 1.0;
      }
    else {
      r = 1.0;
    }
    c = color(r*255, g*255, b*255);
  }
  float getAmp (float x, float y) {
    //if (WAVE_TYPE == PLANAR) {
    //  float dist = x-originalPos.x;
    //  if (dist < 0) return 0;
    //  float phase = (dist / wavelength) * TWO_PI;
    //  return amp * sin(phase);
    //}
    //else {
    //  float dist = dist(originalPos.x, originalPos.y, x, y);
    //  if (dist == 0) return amp;
    //  float phase = (dist / wavelength) * TWO_PI;
    //  return (amp / dist) * sin(phase);
    //}
    float totalAmp = 0;
    for (Point p : points) {
      if (p == null) continue;
      float dist = dist(p.getX(), p.getY(), x,y);
      float phase = (dist / wavelength) * TWO_PI;
      totalAmp += p.getAmp() / sqrt(dist) * sin(phase);
    }
    if (Float.isNaN(totalAmp)) return 0;
    return totalAmp;
  }

  void propagate() {
    for (Point point : points) {
      point.move();
    }
  }

  boolean hitSlit() {
    if (WAVE_TYPE == SPHERICAL) {
      return false;
    }
    float pos = points.get(0).getX();
    return pos >= width/2;
  }

  void changeType() {
    WAVE_TYPE = SPHERICAL;
    int numPoints = points.size();
    points.clear();
    if (MODE == SINGLE_SLIT) {
      for (int i = 0; i < numPoints; i++) {
        Point point = new Point(width/2+20, height/2, 10, 10, c);
        point.velocity.rotate(HALF_PI);
        points.add(point);
      }
      int k = 1;
      for (int i = 0; i < points.size(); i++) {
        Point point = points.get(i);
        point.velocity.rotate(-((PI * k) / 60));
        k++;
      }
    }
    if (MODE == DOUBLE_SLIT) {
      for (int i = 0; i < numPoints; i++) {
        Point point;
        if (i % 2 == 0) {
          point = new Point(width/2+20, height/2-55, 10, 10, c);
        } else {
          point = new Point(width/2+20, height/2+45, 10, 10, c);
        }
        point.velocity.rotate(HALF_PI);
        points.add(point);
      }
      amp = 5;
      int k = 1;
      for (int i = 0; i < points.size(); i+=2) {
        Point first = points.get(i);
        Point second = points.get(i+1);
        first.velocity.rotate(-((PI * k) / 30));
        second.velocity.rotate(-((PI * k) / 30));
        k++;
      }
    }
  }

  void display() {
    if (WAVE_TYPE == SPHERICAL) {
      Point point = points.get(0);
      float r = dist(point.getX(),point.getY(),originalPos.x, originalPos.y);
      float factor = 35/max(1,r*0.1);
      blendMode(REPLACE);
      stroke(c, factor*255);
    }
    else {
      stroke(c);
    }
    strokeWeight(10);
    if (MODE == SINGLE_SLIT) {
      for (int i = 0; i < points.size()-1; i++) {
        Point point1 = points.get(i);
        Point point2 = points.get(i+1);
        line(point1.getX(), point1.getY(), point2.getX(), point2.getY());
      }
    }
    if (MODE == DOUBLE_SLIT) {
      for (int i = 0; i < points.size()-2; i++) {
        Point point1 = points.get(i);
        Point point2 = points.get(i+2);
        line(point1.getX(), point1.getY(), point2.getX(), point2.getY());
      }
    }
  }


}
