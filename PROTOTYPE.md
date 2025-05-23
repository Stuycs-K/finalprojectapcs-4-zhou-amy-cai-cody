# APCS Final Project
## Technical Details:

Period 4 <br/>
**Group Members**: Amy Zhou, Cody Cai <br/>
**Group Name**: OptiX

## Project Discription
We intend to model the interference of light through a diffraction simulator that provides a user interface of the interaction of light waves via two modes: single slit diffraction and double slit diffraction. The detector screen and individual interferences of the light rays will be visible, and the user will be able to customize factors that influence diffraction, namely wavelength of light, distance to screen, and distance between slits (if applicable). It uses the formula dsin(θ) = mλ to model the detector screen pattern and y(x,t) = 2Acos(φ)sin(kx-ωt+φ) to model the interference between two light waves.

# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together. <br/>
 Most recent UML Diagram (updated): 
 ![UML Diagram](/imgs/uml_v2.png)

 ![UML Diagram](/imgs/uml_v1.png)

This is what we hope the finished product will look like:

  ![Final Product](/imgs/diffraction.jpg)

# Intended pacing:

Stage 1: Develop Formulas to Model Diffraction
- Formulas for detector modeling based on various factors
- Formulas to model interference between light waves

Stage 2: Develop Individual Classes
~- Calculation classes~
- 5/24, Amy: Light ~ray /~ wave classes (updated)
- 5/27, Cody:  Detector class
- ~Peaks class (new)~ 
- 5/27, Amy: Slits class
- 5/27, Amy: Interference Class (new)
- We will begin developing classes to work with single slit diffraction, adding updated modes afterwards (new)

Stage 3: Wave Interference Interface ~(4 days)~
- 5/30 Show how light waves interact with each other on Processing
- Amy: integrate classes to make the interference display (new)
- Cody: integrate classes to make the detector display (new)

~Stage 4: Detector Implementation
- Create the detector screen in Processing
- Use diffraction formulas~

Stage 4: Implementing Various Modes
- 6/2, Cody: Create double slit diffraction mode 
~- The code development will begin with single slit diffraction, and if time permits, double slit diffraction~and diffraction gratings~ will be explored~
~- Apply equations to make other mode interfaces user friendly~

Stage 6: Customizable Factors
- 6/2, Amy: Add processes for user to customize factors that influence diffraction and interference patterns
- 6/2, Amy: Explore different ways to take user input
- 6/3, Amy: Update screen with ticks when the factor is changed 
