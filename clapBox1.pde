void clapBox1(float c, float smooth) {
  noFill();
  stroke(red);
  cbox1 = createShape(BOX, (c*120 + 120) * smooth);
  shape(cbox1);
}
