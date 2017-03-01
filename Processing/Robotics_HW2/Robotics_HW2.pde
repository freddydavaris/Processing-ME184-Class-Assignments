//cooperation by Freddy Davaris, Georgios Pesmazoglou, Faris Shamsi

float x, y, z, w;
float end_coord_x = 170; //increasing x will move the point
// towards the rightmost side of  (from 0 - 200)
// the window

float end_coord_y = -30; //increasing y will move the point
// towards the downwards direction  (from -100 to 100)
// of the window

float end_coord_z = 0; // our end coordinate needs to 
// be on the board so z is always
// zero
float common_x, common_y, common_z; 

float joint_length = sqrt(50000)/2; 



void setup() {
  size(600, 600, P3D);
  background(60, 160, 160); 
  x = width/2;
  y = height/2;
  z = 0;
  w = 150; 

  camera(300, 100, 300, x, y, z, 
   0.0, 1.0, 0.0);
}

void draw() {
  translate(x, y, z); 
  rotateX(PI/2);
  rectMode(CENTER);
  rect(0, 0, 200, 200); 
  translate(-100, 0, 0);
  for (int i = 0; i < 10; i++) { 
      line (0+20*i,0+20*i,0,200,200,0);
  }
  sphere(5);        

  common_x = end_coord_x/2; 
  common_y = end_coord_y/2;
  common_z = sqrt(sq(end_coord_x) + sq(end_coord_y))*sin(acos(sqrt(sq(end_coord_x) + sq(end_coord_y))/(2*joint_length)));
  //line one starts from (0,0,0) origin
  line (0, 0, 0, common_x, common_y, common_z);
  line (common_x, common_y, common_z, end_coord_x, end_coord_y, end_coord_z);
  float angle_phi = acos(sqrt(sq(end_coord_x) + sq(end_coord_y))/(2*joint_length));
  float angle_theta = atan(-y/x); 
  angle_phi = 180*angle_phi/PI;
  angle_theta = 180*angle_theta/PI;

println("Angle PHI:", angle_phi, "and angle THETA:", angle_theta);
  
}