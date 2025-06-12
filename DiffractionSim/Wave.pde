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

  Wave(float startPos, int type, float wavelength, float x, float y, float amp){
    points = new ArrayList<Point>();
    position = new PVector(x, y);
    this.amp = amp;
    this.wavelength = wavelength;
    for (int i = 0; i < height; i+=10) {
      Point point = new Point(startPos, i, speed, amp);
      points.add(point);
    }
    WAVE_TYPE = type;
    originalPos = new PVector(startPos, 0);
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
    float r = 0.0;
    float g = 0.0;
    float b = 0.0;

    if (w >= 380 && w < 390) {
      r = 0.3 * (390 - w) / (390 - 380);
      b = 1.0;
    }
    else if (w >= 390 && w < 455) {
      b = 1.0;
      g = (w - 390) / (455 - 390);
    }
    else if (w >= 455 && w < 490) {
      g = 1.0;
      b = (490 - w) / (490 - 455);
    }
    else if (w >= 490 && w < 577) {
      g = 1.0;
      r = (w - 490) / (577 - 490);
    }
    else if (w >= 577 && w < 596) {
      r = 1.0;
      g = 1.0 - ((w - 577) / (596 - 577));
    }
    else if (w >= 596 && w < 622) {
      r = 1.0;
      g = 0.5 * (1.0 - (w - 596) / (622 - 596));
    }
    else if (w >= 622 && w <= 782) {
      r = 1.0;
    }

    c = color(r * 255, g * 255, b * 255);
  }

  float getAmp(float x, float y) {
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

    // reduce amplitude after diffraction
    if (amp > 0) {
      amp = 5;
    } else {
      amp = -5;
    }

    if (MODE == SINGLE_SLIT) {
      for (int i = 0; i < numPoints; i++) {
        Point point = new Point(width / 2 + 20, height / 2, 10, amp);
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
          point = new Point(width / 2 + 20, height / 2 - 55, 10, amp);
        } else {
          point = new Point(width / 2 + 20, height / 2 + 45, 10, amp);
        }
        point.velocity.rotate(HALF_PI);
        points.add(point);
      }

      int k = 1;
      for (int i = 0; i < points.size(); i += 2) {
        Point first = points.get(i);
        Point second = points.get(i + 1);
        first.velocity.rotate(-((PI * k) / 30));
        second.velocity.rotate(-((PI * k) / 30));
        k++;
      }
    }
  }

  void display() {
    blendMode(REPLACE);
    float opacity = 255;
    if (amp < 0) {
      opacity = 100;
    }
    if (WAVE_TYPE == SPHERICAL) {
      Point point = points.get(0);
      float r = dist(point.getX(),point.getY(),originalPos.x, originalPos.y);
      float factor = 35/max(1,r*0.1);
      stroke(c, factor * opacity);
    }
    else {
      stroke(c, opacity);
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
