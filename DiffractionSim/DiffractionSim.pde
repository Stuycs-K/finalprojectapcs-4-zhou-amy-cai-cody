import controlP5.*;

ControlP5 cp5;
float sliderValue = 4;

static int MODE;
static int SINGLE_SLIT = 1;
static int DOUBLE_SLIT = 2;
Detector detector;
Slit slit;
ArrayList<Source> sources;
ArrayList<Wave> waves;
boolean paused = false;
float wavelength;

void setup(){
  size(600, 600);
  frameRate(20);
  wavelength = 400;

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
  color c = wavelengthToColor(wavelength);
  detector = new Detector(width, c, waves);
  detector.display();

  // displaying initial state
  slit.display();

}

  color wavelengthToColor(float w) {
    float r = 0.0;
    float g = 0.0;
    float b = 0.0;
    if (380 <= w && w < 400) {
      r = 0.3 * (-(w - 440) / (440 - 380));
      b = 1.0;
    }
    else if (w < 490) {
      g = (w-440) / (490-440);
      b = 1.0;
    }
    else if (w < 510) {
      g = 1.0;
      b = -(w-510)/(510-490);
    }
    else if (w < 580) {
      r = (w-510) / (580-510);
      g = 1.0;
    }
    else {
      r = 1.0;
    }
    return color(r*255, g*255, b*255);
  }

void draw(){
  background(0);

  float frequency = cp5.getController("Frequency").getValue() * 1e14;
  float wavelength = (3e8 / frequency) * 1e9;
  this.wavelength = wavelength;

  if (!paused && frameCount % 10 == 0) {
    Wave wave = sources.get(0).generateWave(0, height/2, wavelength);
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
  detector = new Detector(width, wavelengthToColor(wavelength), waves);
  frameCount = 0;
}
