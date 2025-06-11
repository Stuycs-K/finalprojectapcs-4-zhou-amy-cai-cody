import controlP5.*;

ControlP5 cp5;
float sliderValue = 4;

static int MODE;
static int SINGLE_SLIT = 1;
static int DOUBLE_SLIT = 2;
//Detector detector;
Slit slit;
ArrayList<Source> sources;
ArrayList<Wave> waves;
boolean paused = false;

void setup(){
  size(600, 600);
  frameRate(20);
  
  // setting up frequency slider
  cp5 = new ControlP5(this);
  cp5.addSlider("Frequency")
   .setPosition(5, 15)
   .setSize(100, 20)
   .setRange(3.84, 7.69)
   .setValue(4)
   .setColorLabel(color(0))
   .getValueLabel()
   .setVisible(false);

  cp5.getController("Frequency").getCaptionLabel().setVisible(false);

  // setting up slit(s)
  MODE = SINGLE_SLIT;
  slit = new Slit(MODE, 1);

  // setting up sources
  sources = new ArrayList<Source>();
  sources.add(new Source(0, height/2, 0));

  // setting up waves
  waves = new ArrayList<Wave>();

  //setting up detector
  //detector = new Detector(width, waves);
  //detector.display();

  // displaying initial state
  slit.display();

}

void draw(){
  background(0);
  
  float frequency = cp5.getController("Frequency").getValue() * 1e14;
  float wavelength = (3e8 / frequency) * 1e9;
  
  if (!paused && frameCount % 10 == 0) {
    Wave wave = sources.get(0).generateWave(wavelength);
    waves.add(wave);
  }
  
  for (int i = 0; i < waves.size(); i++) {
    Wave wave = waves.get(i);
    wave.updateWavelength(wavelength);
    if (!paused) {
      if (frameCount >= i * 5) {
        wave.propagate();
      }
      if (wave.hitSlit()) {
        wave.changeType();
      }
    }
    wave.display();
  }
  slit.display();
  
  // input box
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(0, 0, 120, 50);
  
  fill(0);
  textSize(10);
  text("Frequency: " + nf(cp5.getController("Frequency").getValue(), 1, 2) + "* 10^14", 5, 10);
  
}

void keyPressed() {
  
  if (key == 'p') {
    paused = !paused;
  }
  if (key == '1') {
    MODE = SINGLE_SLIT;
    reset();
  }
  else if (key == '2') {
    MODE = DOUBLE_SLIT;
    reset();
  }
}

void reset() {
  sources = new ArrayList<Source>();
  sources.add(new Source(0, height/2, 0));
  waves = new ArrayList<Wave>();
  slit = new Slit(MODE, 1);
  frameCount = 0;
}
