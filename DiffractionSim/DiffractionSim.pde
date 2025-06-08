static int MODE;
static int SINGLE_SLIT = 1;
static int DOUBLE_SLIT = 2;
static int PLANAR = 0;
static int SPHERICAL = 1;
Point[][] points;
ArrayList<Integer> wavePositions;
//Detector detector;
Slit slit;
//ArrayList<Source> sources;
//ArrayList<Wave> waves;
//boolean paused = false;

void setup(){
  size(600, 600);
  frameRate(25);
  background(0);
  
  // filling screen with points
  points = new Point[height/5][width/5];
  for (int r = 0; r < points.length; r++) {
    for (int c = 0; c < points[0].length; c++) {
      points[r][c] = new Point(5 * r, 5 * c, 10, 0, PLANAR);
    }
  }
  
  // setting up waves
  wavePositions = new ArrayList<Integer>();
  points[0][0].colorColumn(points, 0, 450);
  wavePositions.add(0);
  
  // setting up slit(s)
  MODE = SINGLE_SLIT;
  slit = new Slit(MODE, 1);
  
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
  slit.display();

}
  
void draw(){
  
  // wave movement
  for (int i = wavePositions.size() - 1; i >= 0; i--) {
    int col = wavePositions.get(i);
    if (col < points.length - 1) {
      // moves wave to the right
      for (int r = 0; r < points[0].length; r++) {
        points[col][r].switchColors(points[col + 1][r]);
      }
      // increase wave x position
      wavePositions.set(i, col + 1);
    } else {
      // removing wave
      points[0][0].colorColumn(points, col, color(0));
      wavePositions.remove(i);
    }
  }
  
  // creating new waves after 20 frames
  if (frameCount % 10 == 0) {
    wavePositions.add(0);
    points[0][0].colorColumn(points, 0, 450);
  }
  
  // displays
  for (int r = 0; r < points.length; r++) {
    for (int c = 0; c < points[0].length; c++) {
      points[c][r].display(); 
    }
  }
  slit.display();
  
}



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
