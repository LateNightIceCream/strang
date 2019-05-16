//float speed = 0.5;

float fillr = 0;
float fillg = 0;
float fillb = 0;
float angle = 0;

float bfieldx, bfieldy;
float time;

float permeability = 1.25663706 * pow(10,-6);
int   windings     = 1000;

float coil_diameter   = 20;
int   coilcount       = 3;
float group_diameter  = 9*coil_diameter * coilcount * 0.618;

Coil[]  coilarray     = new Coil[coilcount];

BVector totalB        = new BVector(450, 450, #9696D8);
float bvectorsumx = 0, bvectorsumy = 0;

float phaseDifference = 2*PI/coilcount;

void setup()
{
  size(900, 900);
  frameRate(60);

  for(int i = 0; i < coilcount; i++) {

    coilarray[i] = new Coil(width/2, height/2, group_diameter, coil_diameter, windings, i*phaseDifference, 30, 0.2, i*phaseDifference, permeability);

  }

  colorMode(HSB, 360, 100, 100);
  time = 0;

}

void draw() {
  background(#00333C);

  noFill();
  stroke(#87E391);
  circle(width/2, height/2, group_diameter);

  for(int i = 0; i < coilcount; i++) {

    totalB.bx += coilarray[i].coilvector.bx;
    totalB.by += coilarray[i].coilvector.by;

    coilarray[i].update();

  }

  totalB.update();
  totalB.bx = 0;
  totalB.by = 0;


  angle+=0.05;

  time += 0.01666666;

}
