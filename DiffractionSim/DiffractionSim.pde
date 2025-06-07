static int MODE;
static int SINGLE_SLIT = 1;
static int DOUBLE_SLIT = 2;
Point[][] points;
//Detector detector;
//Slit slit;
//ArrayList<Source> sources;
//ArrayList<Wave> waves;
//boolean paused = false;

void setup(){
  size(600, 600);
  points = new Point[width/10][height/10];
  
  for (int row = 0; row < points.length; row++) {
    for (int col = 0; col < points[0].length; col++) {
      // test color for now
      int rand = int(random(380, 780));
      Point point = new Point(10 * row, 10 * col, 10, rand);
      points[row][col] = point;
      point.display();
    }
  }
  
//  frameRate(30);
  
//  // setting up slit(s)
//  MODE = SINGLE_SLIT;
//  slit = new Slit(MODE, 1);
  
//  // setting up sources
//  sources = new ArrayList<Source>();
//  sources.add(new Source(0, height/2, 0));
  
//  // setting up waves
//  waves = new ArrayList<Wave>();
//  for (int i = 0; i < 10; i++) {
//    Wave wave = sources.get(0).generateWave();
//    waves.add(wave);
//  }
  
//  //setting up detector
//  detector = new Detector(width, waves.get(0).c, waves);
  
//  // displaying initial state
//  slit.display();

}
  
//void draw(){
//  background(0);
//  for (int i = 0; i < waves.size(); i++) {
//    Wave wave = waves.get(i);
//    if (!paused) {
//      if (frameCount >= i * 5) {
//        wave.propagate(); 
//      }
//      if (wave.hitSlit()) {
//        wave.changeType(); 
//      }
//    }
//    wave.display();
//  }
//  slit.display();
//  detector.display();
//}

//void keyPressed() {
//  if (key == 'p') {
//    paused = !paused; 
//  }
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
//  sources.add(new Source(0, height/2, 0));
//  waves = new ArrayList<Wave>();
//  for (int i = 0; i < 10; i++) {
//    Wave wave = sources.get(0).generateWave();
//    waves.add(wave);
//  }
//  detector = new Detector(width, waves.get(0).c, waves);
//  slit = new Slit(MODE, 1);
//  frameCount = 0;
//}
