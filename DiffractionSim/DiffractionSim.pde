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
    w.propagate(millis()/1000.0);
    if (w.hitSlit()) {
      if (abs(w.position.y - height/2) < 50) {
        Source newSource = slit.generateSource(width/2 + 20, w.position.y);
        newSource.generateWave(Wave.SPHERICAL);
        sources.add(newSource);
        for (int i = 0; i < newSource.waves.size(); i++) {
          waves.add(newSource.waves.get(i));
        }
      }
    }
  }
  for (Source s: sources) {
    s.display();
    for (Wave w: waves) {
      w.display(millis() /1000.0);
    }
  }
  slit.display();
  detector.display();
}
