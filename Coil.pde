class Coil {

  // arguments
  float xpos, ypos, length, diameter, rotangle, amplitude, frequency, phase, permeability;
  int windings;

  // positioning
  float c1_posx, c2_posx, c1_posy, c2_posy;

  // colors
  float hue = 0, saturation = 0, brightness = 0;


  BVector coilvector = new BVector(0,0, #F9F871);

  Coil (float _xpos, float _ypos, float _length, float _diameter, int _windings, float _rotangle, float _amplitude, float _frequency, float _phase, float _permeability) {

    xpos      = _xpos;
    ypos      = _ypos;
    length    = _length;    // distance between points
    diameter  = _diameter;  // circle diameter
    windings  = _windings;  // coil windings
    rotangle  = _rotangle;  // rotation of circle pair (coil)
    amplitude = _amplitude; // cuurent amplitude
    frequency = _frequency; // current frequency
    phase     = _phase;     // current phase
    permeability = _permeability;

    coilvector.xpos = xpos; // a little hacked
    coilvector.ypos = ypos;

  }

  void update() {

    c1_posx = xpos + length/2*cos(PI-rotangle);
    c1_posy = ypos + length/2*sin(PI-rotangle);
    c2_posx = xpos + length/2*cos(rotangle);
    c2_posy = ypos - length/2*sin(rotangle);


    brightness = 100 * abs(cos(2*PI*frequency*time + phase));
    noStroke();
    fill(183, 100, brightness);
    circle(c1_posx, c1_posy, diameter); // c1
    circle(c2_posx, c2_posy, diameter); // c2



    coilvector.bx = B(time) * cos(PI/2-rotangle);
    coilvector.by = B(time) * sin(PI/2-rotangle);
    coilvector.update();

    //text(time, 100,100);
    //text(B(time), 100, 160);


  }

  float i(float t) { // current function

    return (amplitude * cos(2*PI*frequency*t + phase));

  }

  float B(float t) { // magnetic field function

    return windings * i(t) / (2 * (length/2)); // not really B though, because I took out the permeability

  }

}
