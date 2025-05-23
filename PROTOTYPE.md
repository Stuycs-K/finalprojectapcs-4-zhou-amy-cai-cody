# APCS Final Project
## Technical Details:

Period 4 <br/>
**Group Members**: Amy Zhou, Cody Cai <br/>
**Group Name**: OptiX

## Project Discription
We intend to model the interference of light through a diffraction simulator that provides a user interface of the interaction of light waves via two modes: single slit diffraction and double slit diffraction~, and diffraction gratings~. The detector screen and individual interferences of the light rays will be visible, and the user will be able to customize factors that influence diffraction, namely wavelength of light, distance to screen, and distance between slits (if applicable). It uses the formula dsin(θ) = mλ to model the detector screen pattern and y(x,t) = 2Acos(φ)sin(kx-ωt+φ) to model the interference between two light waves.

# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

  ![UML Diagram](/imgs/uml_v1.png)

This is what we hope the finished product will look like:

  ![Final Product](/imgs/diffraction.jpg)

# Intended pacing:

Stage 1: Develop Formulas to Model Diffraction (2 days)
- Formulas for detector modeling based on various factors
- Formulas to model interference between light waves

Stage 2: Develop Individual Classes (2 days)
~- Calculation classes~
- Light ~ray /~ wave classes (updated)
- Detector class
- Peaks class (new) 
- Slits class
- We will begin developing classes to work with single slit diffraction, adding updated modes afterwards (new)

Stage 3: Wave Interference Interface (4 days)
- Show how light waves interact with each other on Processing

~Stage 4: Detector Implementation (3 days)
- Create the detector screen in Processing
- Use diffraction formulas~

Stage 5: Implementing Various Modes (2 days)
- The code development will begin with single slit diffraction, and if time permits, double slit diffraction~and diffraction gratings~ will be explored
- Apply equations to make other mode interfaces user friendly

Stage 6: Customizable Factors (3 days)
- Add processes for user to customize factors that influence diffraction and interference patterns
- Update screen with ticks when the factor is changed
- Explore different ways to take user input

~How you are breaking down the project and who is responsible for which parts.~

~A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)~
