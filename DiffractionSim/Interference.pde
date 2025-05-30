class Interference {
  ArrayList<Wave> waves;
  int fringeWidth;
  int fringeHeight;

  float getAmp(float x, float y ,float t) {
  	float instAmp = 0;
  	for (int i = 0; i < waves.size(); i++) {
  		float+=waves.get(i).getAmp(x,y,t);
  	}
  	return instAmp;
  }  
  
  void display() {
    
  }
  
}
