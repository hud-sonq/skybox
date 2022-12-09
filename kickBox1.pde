void kickBox1(float k, float smooth) {
  noFill();
  stroke(green);
  kbox1 = createShape(BOX, width/5 + (k*4));
  strokeWeight(5);
  if (k >= 16) {
    strokeWeight(10);
    angle+=3;
  }
  shape(kbox1);
}
