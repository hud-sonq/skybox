void bassBox1(float b, float c, float smooth) {
  if(b >= 0.5 && c < 1) {
  noFill();
  stroke(red);
  bbox1 = createShape(BOX, width/5 + (b*4));
  shape(bbox1);
  }
}
