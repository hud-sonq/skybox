void qw2(float q, float smooth, PImage i) {
  //noStroke();
  int scale = width/2;
  qw2s = createShape(SPHERE, scale+q);
  ////textureMode(NORMAL);
  //qw2s.setTexture(i);
  if (q > 3.3) {
    stroke(red);
    //noStroke();
    shape(qw2s);
    angle += 4;
    scale /= 15;
    r3 += 3;
    r1+= 1;
  }
}
