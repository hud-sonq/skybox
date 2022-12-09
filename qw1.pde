
void qw1 (float q, float smooth, PImage i, float k) {
  //noStroke();
  qw1s = createShape(SPHERE, width/2+q);
  //textureMode(NORMAL);
  //qw1s.setTexture(i);
  if (q > 4.7) {
    stroke(red);
    //noFill();
    //noStroke();
    shape(qw1s);
    angle += 2.5;
    r3 -= 3;
    red -= random(30, 90);
  }
  if (k >= 16) {
    green *= -1;
    red *= -1 + random(60, 120);
  }
}
