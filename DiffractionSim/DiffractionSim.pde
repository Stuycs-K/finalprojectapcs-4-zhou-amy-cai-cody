class Diffraction {
  static int MODE;
  static int SINGLE_SLIT = 1;
  static int DOUBLE_SLIT = 2;
  Detector detector;
  Slit slit;
  ArrayList<Source> sources;

  void setup(){
    MODE = SINGLE_SLIT;
    Detector detector = new Detector();
    Slit slit = new Slit();
  }
  void draw(){
    
  }

}
