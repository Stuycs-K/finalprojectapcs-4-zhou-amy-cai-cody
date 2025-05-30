static int MODE;
static int SINGLE_SLIT = 1;
static int DOUBLE_SLIT = 2;
Detector detector;
Slit slit;
ArrayList<Source> sources;

void setup(){
  // set the mode, display initial source, slits, and detector
  MODE = SINGLE_SLIT;
  detector = new Detector();
  slit = new Slit(SINGLE_SLIT, 1);
  sources.add(new Source(0, height/2));
  
  detector.display();
  slit.display();
  sources.get(0).display();
}
  
void draw(){
  
}
