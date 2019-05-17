class BVector {

  float xpos, ypos, lengthx, lengthy;
  float hue;

  float bx = 0, by = 0;

  BVector (float _xpos, float _ypos, float _hue) {

    xpos     = _xpos;
    ypos     = _ypos;
    hue      = _hue;

  }

  void update() {

    lengthx = xpos+bx; // bad name
    lengthy = ypos+by;
    strokeWeight(1.618);
    stroke(hue, 46, 72);
    line(xpos, ypos, lengthx, lengthy);
  }

}
