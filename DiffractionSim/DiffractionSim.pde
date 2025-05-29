class DiffractionSim {
int MODE;
int SINGLE_SLIT = 1;
int DOUBLE_SLIT = 2;
Detector detector;
Slit slit;
ArrayList<Source> sources;

  void setup(){
    MODE = SINGLE_SLIT;
    detector = new Detector();
    Slit slit = new Slit();
  }
  void draw(){}
  
}
