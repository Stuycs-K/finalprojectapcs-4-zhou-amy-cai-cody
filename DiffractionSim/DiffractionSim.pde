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
  detector = new Detector(width, wavelengthToColor(wavelength), waves);
  detector.display();

  // displaying initial state
  slit.display();

}

color wavelengthToColor(float w) {
  float r = 0.0;
  float g = 0.0;
  float b = 0.0;

  if (w >= 380 && w < 390) {
    r = 0.3 * (390 - w) / (390 - 380);
    b = 1.0;
  }
  else if (w >= 390 && w < 455) {
    b = 1.0;
    g = (w - 390) / (455 - 390);
  }
  else if (w >= 455 && w < 490) {
    g = 1.0;
    b = (490 - w) / (490 - 455);
  }
  else if (w >= 490 && w < 577) {
    g = 1.0;
    r = (w - 490) / (577 - 490);
  }
  else if (w >= 577 && w < 596) {
    r = 1.0;
    g = 1.0 - ((w - 577) / (596 - 577));
  }
  else if (w >= 596 && w < 622) {
    r = 1.0;
    g = 0.5 * (1.0 - (w - 596) / (622 - 596));
  }
  else if (w >= 622 && w <= 782) {
    r = 1.0;
  }

  return color(r * 255, g * 255, b * 255);
}

void draw(){
  background(0);

  float frequency = cp5.getController("Frequency").getValue() * 1e14;
  float w = (3e8 / frequency) * 1e9;
  this.wavelength = w;

  if (!paused && frameCount % 5 == 0) {
    float amp = 10;
    if ((frameCount/5) % 2 == 0) {
      amp = -10;
    }
    Wave wave = sources.get(0).generateWave(0, height/2, w, amp);
    waves.add(wave);
  }

  for (int i = 0; i < waves.size(); i++) {
    Wave wave = waves.get(i);
    wave.updateWavelength(wavelength);
    wave.active();
    if (!wave.active) {
      waves.remove(i);
      i--;
    }
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
  color c = wavelengthToColor(w);
  detector.c = c;
  detector.display();

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
