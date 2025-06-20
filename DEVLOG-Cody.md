# Dev Log:

This document must be updated daily every time you finish a work session.

## Dave Kim CHANGE THE NAME FOOL!

### 2024-01-02 - Brief description
Expanded description including how much time was spent on task.

### 2025-05-20 - UML and Conceptual Diagrams

Created first version of the classes and methods we will implement for the diffraction simulation. A diagram is also provided to visualize what the end product should look like.

### 2025-05-27 - UML and Code Skeletons

Created the fourth version of our UML diagram according to today's suggestions in class. Added code skeletons according to new methods/plan of attack for the sim.

### 2025-05-28 - Source and Wave Class

After thinking about how we will produce spherical waves, I added a Source class for the source of the wavefronts and reworked the Wave class. These updates were also added to the UML.

### 2025-05-29 - Wave Types and Displays

Wrote the display methods for Source and Wave whilst also creating two types of waves which will be created in the simulation: spherical and planar waves.

### 2025-06-02 - Rewriting Wave Class

After today's MVP suggestions, I rewrote the Wave class to use be a locus of a new Point class. Using these points, I reworked how waves moved on the screen, with planar ones propagating horizontally and spherical ones radiating outwards from the slits. I plan to work on displaying waves as gradients based on their amplitudes next.

### 2025-06-03 - Wave Display and Simulation Setup

I changed the display() function for Wave to display a smooth wavefront rather than multiple points. Then I rewrote the setup() and draw() methods using the new Wave, Point, and Source classes to run the simulation smoothly.

### 2025-06-04 - Working on Simulation

Worked on making the waves display as gradients and removing the points once they go off screen. Also began working on the Detector and Interference classes.

### 2025-06-06 - Reworking Point and Wave Classes

After todays suggestions, we decided to rework how waves are displayed and the behavior of Points. I used a 2d array of points and filled the screen with points instead of previously displaying select points.

### 2025-06-06/7 - Continued Working on Wave Gradient and Interference Visuals

Tried to use the array of points and create a gradient between peaks of the waves. Also tried implementing a BFS algorithm for the spherical waves.

### 2025-06-10/11 - Working on Displaying Interference Pattern

Reverted to old version of displaying waves as collections of points with associated position and velocity PVectors. Trying to get the Detector class to work and display the interference pattern.

I believe this document accurately reflects the contributions of my teamate
- Amy
