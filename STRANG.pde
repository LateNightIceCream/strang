float time;

//float permeability = 1.25663706 * pow(10,-6);
int   windings     = 1000;

float coil_diameter   = 30;
int   coilcount       = 3;
float group_diameter  = 9*coil_diameter * coilcount * 0.618;

Coil[]  coilarray     = new Coil[coilcount];

BVector totalB        = new BVector(300, 300, 0);

float phaseDifference = PI/coilcount;

void setup()
{
  size(600, 600);
  frameRate(60);

  smooth(8);

  for(int i = 0; i < coilcount; i++) {

    coilarray[i] = new Coil(width/2, height/2, group_diameter, coil_diameter, windings, i*phaseDifference, 30, 0.2, i*phaseDifference, 183);

  }

  totalB.hue = 240;

  colorMode(HSB, 360, 100, 100);
  time = 0;

}

void draw() {
  background(#00333C); // #00333C

  noFill();
  stroke(#87E391); // #87E391
  circle(width/2, height/2, group_diameter); // outer ring

  for(int i = 0; i < coilcount; i++) {

    totalB.bx += coilarray[i].coilvector.bx;
    totalB.by += coilarray[i].coilvector.by;

    coilarray[i].update();
    coilarray[i].hue = i*100; // i*100 for better visualisation, abs(coilarray[i].coilvector.by)*4

  }

  totalB.update();
  totalB.bx = 0;
  totalB.by = 0;

  time += 0.016666;

}
