class BVector {

  float xpos, ypos;
  int hexcolor;

  float bx = 0, by = 0;

  BVector (float _xpos, float _ypos, int _hexcolor) {

    xpos     = _xpos;
    ypos     = _ypos;
    hexcolor = _hexcolor;

  }

  void update() {
    stroke(hexcolor);
    line(xpos, ypos, xpos+bx, ypos+by);
  }

}
