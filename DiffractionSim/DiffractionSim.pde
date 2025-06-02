static int MODE;
static int SINGLE_SLIT = 1;
static int DOUBLE_SLIT = 2;
Detector detector;
Slit slit;
ArrayList<Source> sources;
ArrayList<Wave> waves;

void setup(){
  // set the mode, display initial source, slits, and detector
  size(1200,600);
  MODE = SINGLE_SLIT;
  sources = new ArrayList<Source>();
  waves = new ArrayList<Wave>();
  Source original = new Source(0, height/2);
  original.generateWave(Wave.PLANAR);
  sources.add(original);
  for (int i = 0; i < original.waves.size(); i++) {
    waves.add(original.waves.get(i));
  }
  detector = new Detector(width, waves);
  slit = new Slit(SINGLE_SLIT, 1);
  //sources.add(new Source(0, height/2));
  
  detector.display();
  slit.display();
  sources.get(0).display();
}
  
void draw(){
  background(0);
  for (Wave w: waves) {
    w.propagate();
  }
  slit.display();
  detector.display();
}
