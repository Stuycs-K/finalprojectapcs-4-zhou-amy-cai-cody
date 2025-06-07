import java.util.*;
//class Wave {
//  PVector position, velocity, originalPos;
//  float wavelength;
//  float speed;
//  float amplitude;
//  float maxAmplitude;
//  float frequency;
//  int WAVE_TYPE;
//  static final int PLANAR = 0;
//  static final int SPHERICAL = 1;
//  float distance = 0;
//  color c;
//  float time;
//  boolean converted = false;
//  boolean active = true;


//  float getPhase(float x, float y) {
//    float r = dist(x,y,position.x, position.y);
//    float k = TWO_PI / wavelength;
//    return k * r;
//  }

//  float getAmp(float x, float y, float t) {
//    if (WAVE_TYPE == PLANAR) {
//      position = PVector.add(originalPos, PVector.mult(velocity,t-time));
//      return amplitude * sin(getPhase(x,y) - frequency * (t-time));
//    }
//    else {
//      float r = dist(x,y,originalPos.x, originalPos.y);
//      float amp = amplitude / max(1,r*0.1);
//      return amp * sin(getPhase(x,y) - frequency * (t-time));
//    }
//  }

//  void changeType() {
//    WAVE_TYPE++;
//    WAVE_TYPE%=2;
//  }

//  void setAmp(float amp) {
//    amplitude = amp;
//  }

//  void display(float t) {
//    propagate(t);
//    noFill();
//    stroke(c);
//    //stroke(c, amplitude/maxAmplitude);
//    if (WAVE_TYPE == PLANAR) {
//      float xPos = originalPos.x + velocity.x * (t-time);
//      line(xPos, 0, xPos, height);
//    }
//    if (WAVE_TYPE == SPHERICAL) {
//      float r = velocity.mag() * (t-time);
//      circle(originalPos.x, originalPos.y, r);
//    }
//  }

//  boolean hitSlit() {
//    if (converted || WAVE_TYPE == SPHERICAL) return false;
//    return (position.x >= width /2.5 && position.x < width/2.5 + 20 && abs(position.y - height/2) < 50);
//  }

//}

//class Wave {
//  int WAVE_TYPE;
//  static final int PLANAR = 0;
//  static final int SPHERICAL = 1;
//  //ArrayList<Point> points;
//  PVector originalPos;
//  float wavelength;
//  color c;

//  Wave(float startPos, int type, float wavelength){
//    WAVE_TYPE = type;
//    //points = new ArrayList<Point>();
//    this.wavelength = wavelength;
//    float w = wavelength * 10e9;
//    float r = 0;
//    float b = 0;
//    float g = 0;
//    if (380 <= w && w < 400) {
//      r = -(w-440) / (440-380);
//      b = 1.0;
//    }
//    else if (w < 490) {
//      g = (w-440) / (490-440);
//      b = 1.0;
//    }
//    else if (w < 510) {
//      g = 1.0;
//      b = -(w-510)/(510-490);
//    }
//    else if (w < 580) {
//      r = (w-510) / (580-510);
//      g = 1.0;
//    }
//    else {
//      r = 1.0;
//    }
//    c = color(r*255,g*255,b*255);
//    for (int i = 0; i < height; i+=10) {
//      Point point = new Point(startPos, i, 10, 10, c);
//      points.add(point);
//    }
//    originalPos = new PVector(startPos, 0);
//    originalPos = new PVector(startPos, 0);
//  }

//  ArrayList<Point> getPoints() {
//    return points;
//  }

//  void propagate() {
//    if (WAVE_TYPE == SPHERICAL) {
//      for (Point point : points) {
//        float r = dist(point.getX(),point.getY(),originalPos.x, originalPos.y);
//        float factor = 1/max(1,r*0.1);
//        point.setAmplitude(point.getAmp() * factor);
//        fill(c, (point.getAmp() / point.maxAmp) * 255 );
//        point.move();
//      }
//    }
//    else {
//      for (Point point : points) {
//        point.move();
//      }
//    }
//  }

//  boolean hitSlit() {
//    if (WAVE_TYPE == SPHERICAL) {
//      return false;
//    }
//    float pos = points.get(0).getX();
//    return pos >= width/2;
//  }

//  void changeType() {
//    WAVE_TYPE = SPHERICAL;
//    int numPoints = points.size();
//    points.clear();
//    if (MODE == SINGLE_SLIT) {
//      for (int i = 0; i < numPoints; i++) {
//        Point point = new Point(width/2+20, height/2, 10, 10, c);
//        point.velocity.rotate(HALF_PI);
//        points.add(point);
//      }
//      int k = 1;
//      for (int i = 0; i < points.size(); i++) {
//        Point point = points.get(i);
//        point.velocity.rotate(-((PI * k) / 60));
//        k++;
//      }
//    }
//    if (MODE == DOUBLE_SLIT) {
//      for (int i = 0; i < numPoints; i++) {
//        Point point;
//        if (i % 2 == 0) {
//          point = new Point(width/2+20, height/2-55, 10, 10, c);
//        } else {
//          point = new Point(width/2+20, height/2+45, 10, 10, c);
//        }
//        point.velocity.rotate(HALF_PI);
//        points.add(point);
//      }
//      int k = 1;
//      for (int i = 0; i < points.size(); i+=2) {
//        Point first = points.get(i);
//        Point second = points.get(i+1);
//        first.velocity.rotate(-((PI * k) / 30));
//        second.velocity.rotate(-((PI * k) / 30));
//        k++;
//      }
//    }
//  }
  
//  float getAmp(float x, float y) {
//    float totalAmp = 0;
//    for (Point p : points) {
//      float dist = dist(p.getX(), p.getY(), x, y);
//      float phase = (dist / wavelength * 10e9) * TWO_PI;
//      totalAmp += (p.getAmp() / sqrt(dist)) * sin(phase);
//    }
//    return totalAmp;
//  }
 
//  void display() {
//    if (WAVE_TYPE == SPHERICAL) {
//      Point point = points.get(0);
//      float r = dist(point.getX(),point.getY(),originalPos.x, originalPos.y);
//      float factor = 25/max(1,r*0.1);
//      blendMode(REPLACE);
//      stroke(c, factor*255);
//    }
//    else {
//      stroke(c);
//    }
//    strokeWeight(5);
//    if (MODE == SINGLE_SLIT) {
//      for (int i = 0; i < points.size()-1; i++) {
//        Point point1 = points.get(i);
//        Point point2 = points.get(i+1);
//        line(point1.getX(), point1.getY(), point2.getX(), point2.getY());
//      }
//    }
//    if (MODE == DOUBLE_SLIT) {
//      for (int i = 0; i < points.size()-2; i++) {
//        Point point1 = points.get(i);
//        Point point2 = points.get(i+2);
//        line(point1.getX(), point1.getY(), point2.getX(), point2.getY());
//      }
//    }
//  }


//}
