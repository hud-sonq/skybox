void kickBox2(float k, float smooth) {
  float scale = (width/5 + (k*4));
  noFill();
  stroke(green);
  if (k >= 16) {
    strokeWeight(10);
    scale = (width/5.5 + (k*4));
    stroke(red);
  }
  kbox1 = createShape(BOX, scale); 
  shape(kbox1);
}
