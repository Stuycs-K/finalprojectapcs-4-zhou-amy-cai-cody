static int MODE;
static int SINGLE_SLIT = 1;
static int DOUBLE_SLIT = 2;
//Detector detector;
Slit slit;
ArrayList<Source> sources;
Frontier waves;
//float lastWave;

void setup(){
  size(600, 600);
  MODE = SINGLE_SLIT;
  slit = new Slit(MODE, 1);
  sources = new ArrayList<Source>();
  sources.add(new Source(0, height/2, 0));
  waves = new Frontier();
  slit.display();
  //// set the mode, display initial source, slits, and detector
  //size(600,600);
  //MODE = SINGLE_SLIT;
  //sources = new ArrayList<Source>();
  //waves = new ArrayList<Wave>();
  //Source original = new Source(0, height/2, 0);
  //original.generateWave();
  //sources.add(original);
  //lastWave = millis();
  //for (int i = 0; i < original.waves.size(); i++) {
  //  waves.add(original.waves.get(i));
  //}
  //detector = new Detector(width, waves);
  //slit = new Slit(SINGLE_SLIT, 1);
  ////sources.add(new Source(0, height/2));
  
  //detector.display();
  //slit.display();
  //sources.get(0).display();
}
  
void draw(){
  background(0);
  //if (millis() - lastWave > 300) {
  //  for (Source s : sources) {
  //    s.generateWave();
  //  }
  //  lastWave = millis();
  //}
  //for (int i = 0; i < waves.size(); i++) {
  //  Wave w = waves.get(i);
  //  w.propagate(millis() / 1000.0);
  //  if (w.hitSlit()) {
  //    if (MODE == SINGLE_SLIT) {
  //      Source newSource = slit.generateSource(width/2.5+10, w.position.y, 1);
  //      newSource.generateWave();
  //      sources.remove(0);
  //      sources.add(newSource);
  //      waves = newSource.waves;
  //    }
  //    else {
  //      Source newSource1 = slit.generateSource(width/2.5+10, height/2-55, 1);
  //      Source newSource2 = slit.generateSource(width/2.5+10, height/2+35, 1);
  //      newSource1.generateWave();
  //      newSource2.generateWave();
  //      sources.remove(0);
  //      sources.add(newSource1);
  //      sources.add(newSource2);
  //      waves = newSource1.waves;
  //      for (Wave a : newSource2.waves) {
  //        waves.add(a);
  //      }
  //    }
  //  }
  //}
  /*ArrayList<Wave> newWaves = new ArrayList<Wave>();
  ArrayList<Source> newSources = new ArrayList<Source>();
  for (Wave w: waves) {
    w.propagate(millis()/1000.0);
    if (w.hitSlit()) {
      if (abs(w.position.y - height/2) < 50) {
        Source newSource = slit.generateSource(width/3 + 20, w.position.y, 1);
        newSource.generateWave();
        sources.add(newSource);
        newSources.add(newSource);
        for (int i = 0; i < newSource.waves.size(); i++) {
          newWaves.add(newSource.waves.get(i));
          //waves.add(newSource.waves.get(i));
        }
      }
    }
  }
  for (int i = 0; i < newSources.size(); i++) {
    sources.add(newSources.get(i));
  }
  for (int i = 0; i < newWaves.size(); i++) {
    waves.add(newWaves.get(i));
  }*/
  //for (Source s: sources) {
  //  s.display();
  //  for (Wave w: waves) {
  //    w.display(millis() /1000.0);
  //  }
  //}
  //slit.display();
  //detector.display();
}

//void keyPressed() {
//  if (key == '1') {
//    MODE = SINGLE_SLIT;
//    reset();
//  }
//  else if (key == '2') {
//    MODE = DOUBLE_SLIT;
//    reset();
//  }
//}

//void reset() {
//  sources = new ArrayList<Source>();
//  waves = new ArrayList<Wave>();
//  Source original = new Source (0, height/2, 0);
//  original.generateWave();
//  sources.add(original);
//  for (Wave w : original.waves) {
//    waves.add(w);
//  }
//  slit = new Slit(MODE, 1);
//}
