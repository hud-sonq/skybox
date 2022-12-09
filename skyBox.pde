/* 
 * skyBox.pde, Hudson Quatro. CS276. December 9, 2022.
 * A simple audio visualization for your tracks.
 * This program is intended for producers.
*/

import processing.sound.*;

// All tracks:
SoundFile kick;
SoundFile bass;
SoundFile hat;
SoundFile clap;
SoundFile qwaves;
SoundFile qwaves2;
SoundFile melody;
SoundFile other;

// Amplitudes: 
Amplitude kamp;  // kick
Amplitude bamp;
Amplitude hamp;  // hat
Amplitude camp;  // clap 
Amplitude qamp1; // qwave1
Amplitude qamp2; // qwave2
Amplitude mamp;  // melody
Amplitude oamp;  // others

// sum of each track
float ksum;
float bsum;
float hsum;
float csum;
float qsum;
float q2sum;
float msum;
float osum;

// Angle / rotation numbers
float theta = 0.0;
float angle = 0.0;
float r1 = 0.0;
int r2 = 1;
int r3 = 0;

// All shapes
PShape kglobe1;
PShape bbox1;
PShape kbox1;
PShape kbox2;
PShape cbox1;
PShape qw1s;
PShape qw2s;
PShape mbox1;
PShape bguy;
PImage img; //sphere texture
PImage img2;
float smooth = 0.69; // smooothing factor

// Colors
color lightblue = color(78, 210, 220);
color green = color(35, 255, 30, 95);
color red = color(255, 50, 50, 95);

void setup() {
  r1 = 0.0;
  size (800, 800, P3D);
  float m = millis(); // time counter
  
  // Initialize and play all tracks
  kick = new SoundFile(this, "r_kick.wav");
  kick.loop();
  kamp = new Amplitude(this);
  kamp.input(kick);
  
  bass = new SoundFile(this, "bass.wav");
  bass.loop();
  bamp = new Amplitude(this);
  bamp.input(bass);

  hat = new SoundFile(this, "r_htops.wav");
  hat.loop();
  hamp = new Amplitude(this);
  hamp.input(hat);

  clap = new SoundFile(this, "r_snrclp2.wav");
  clap.loop();
  camp = new Amplitude(this);
  camp.input(clap);

  qwaves = new SoundFile(this, "waves.wav");
  qwaves.loop();
  qamp1 = new Amplitude(this);
  qamp1.input(qwaves);
  
  qwaves2 = new SoundFile(this, "waves2.wav");
  qwaves2.loop();
  qamp2 = new Amplitude(this);
  qamp2.input(qwaves2);
  
  other = new SoundFile(this, "after_rain2.wav");
  other.loop();
  oamp = new Amplitude(this);
  oamp.input(other);
  surface.setResizable(true);
  
  img = loadImage("stars.jpg");
  img2 = loadImage("cubes2.png");
}

void draw() {
  // counters
  float mtotal = millis();
  float mcurrent = millis();
  float xx = width/2;
  float yy = height/2;
  float zz = height/2;
  
  // basics
  background(0);
  translate(xx, yy, zz); // center it all!
  rotate(radians(angle), r1, r2, r3);
  
  
  // Identify amplitudes
  ksum += (kamp.analyze() - ksum);
  float kscaled = ksum * 80;
  bsum += (bamp.analyze() - bsum);
  float bscaled = bsum * 80;
  hsum += (hamp.analyze() - hsum);
  float hscaled = hsum * 80;    
  csum += (camp.analyze() - csum);
  float cscaled = csum * 80;  
  qsum += (qamp1.analyze() - qsum);
  float q1_scaled = qsum * 80;  
  q2sum += (qamp2.analyze() - q2sum);
  float q2_scaled = q2sum * 80;  

  // draw
  kickSphere1(kscaled, smooth);
  bassBox1(bscaled, cscaled, smooth);
  hatBox1(hscaled, smooth);
  clapBox1(cscaled, smooth/2);
  kickBox1(kscaled, smooth);
  kickBox2(kscaled, smooth);
  qw1(q1_scaled, smooth, img2, kscaled);
  qw2(q2_scaled, smooth, img);
  /*
  // bg sphere
  if (q1_scaled < 4.7 && q2_scaled < 3.3) {
    bguy = createShape(SPHERE, width/2);
    textureMode(NORMAL);
    bguy.setTexture(img2);
    shape(bguy);
    angle++;
}
   */
  // constant rotation
  r1 += 2;
  r3 -= 2;
  angle++;
}

void mouseClicked() { 
    red = color((random(255)), (random(255)), (random(255)));
    green = color((random(255)), (random(255)), (random(255)));
    lightblue = color((random(255)), (random(255)), (random(255)));
    sphere(width/2);
}
