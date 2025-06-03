class Interference {
	Frontier waves;
	color c;
	float maxAmp;
	Interference(Frontier waves) {
		this.waves = waves;
		this.c = waves.get(0).c;
		maxAmp = waves.points.get(0).maxAmp;
	}
	float getAmp(float x, float y, float t) {
		float instAmp = 0;
		for (int i = 0; i waves.size(); i++) {
			for (Point p : waves.points) {
				instAmp += p.amplitude;
			}
		}
		return instAmp;
	}
	void display(float x, float y, float t) {
		fill(c, (getAmp(x,y,t)/maxAmp)*255);
		noStroke();
		circle(position.x, position.y, 4); 
	}
}
//class Interference {
//  ArrayList<Wave> waves;
//  int fringeWidth;
//  int fringeHeight;

//  float getAmp(float x, float y ,float t) {
//  	float instAmp = 0;
//  	for (int i = 0; i < waves.size(); i++) {
//  		if (waves.get(i).getAmp(x,y,t) == 0) {
//  			return 0;
//  		}
//  		instAmp+=waves.get(i).getAmp(x,y,t);
//  	}
//  	return instAmp;
//  }
  
//  void display(float x, float y, float t) {
//  	//wave.get(0).setAmp(getAmp(x,y,t));
//  	//wave.get(1).setAmp(getAmp(x,y,t));
//  	//wave.get(0).display;
//  	//wave.get(1).display;
//  }
  
//}
