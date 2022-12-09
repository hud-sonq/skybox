void kickSphere1(float k, float smooth) {
  stroke(lightblue);
  kglobe1 = createShape(SPHERE, (k*2) + (30) * smooth);
  shape(kglobe1);
  
}
