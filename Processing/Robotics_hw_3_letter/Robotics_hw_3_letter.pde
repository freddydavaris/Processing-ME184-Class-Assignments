//cooperation by Freddy Davaris, Georgios Pesmazoglou, Faris Shamsi, Chandler Coble

import processing.net.*;

float x, y, z, w;

float common_x, common_y, common_z; 

float joint_length = sqrt(80000)/4; 

float [] thetas = new float[150];
float [] phis = new float[150];
float [] ksis = new float[150];
Client s; 
// or Server s;

int times = 0;



void setup() {
  size(600, 600, P3D);
  background(60, 160, 160); 
  x = width/2;
  y = height/2;
  z = 0;
  w = 150; 

  

}

void draw() {
  
  camera(200, 0, 00, x, y, z, 
   0.0, 1.0, 0.0);
   frameRate(5);
   //  s = new Server (this, port); // connect to server on port
   float end_coord_x = 175; //increasing x will move the point
  // towards the rightmost side of  (from 0 to 200)
  // the window

  float end_coord_y = 125; //increasing y will move the point
  // towards the downwards direction  (from 0 to 200)
  // of the window

  float end_coord_z = 0; // our end coordinate needs to 
  // be on the board so z is always
    // zero
  
  translate(x, y, z); 
  rotateX(PI/2);
  rectMode(CENTER);
  rect(0, 0, 200, 200); 
  translate(-100, -100, 0);
  sphere(5);        

  common_x = end_coord_x/2; 
  common_y = end_coord_y/2;
  common_z = sqrt(sq(end_coord_x) + sq(end_coord_y))*sin(acos(sqrt(sq(end_coord_x)
                                  + sq(end_coord_y))/(2*joint_length)));
                                  
if (times < 1) {
  // horizontal top line of letter "F"
  for (int i = 0; i < 50; i++){
  
  line (0, 0, 0, common_x, common_y, common_z);
  line (common_x, common_y, common_z, end_coord_x, end_coord_y, end_coord_z);
   end_coord_y = end_coord_y-1; 
   thetas[i] = acos(sqrt(sq(end_coord_x) + sq(end_coord_y))/(2*joint_length));
   phis[i] = atan(-end_coord_y/end_coord_x);

   
   int val_one = round(180*phis[i]/PI);
   int val_two = -round(180*(thetas[i])/PI);
   int val_three = -round((180 - 2*180*thetas[i]/PI));
   int val_four = -round((90+180*(thetas[i])/PI));

   s = new Client (this, "172.16.185.137",5002); // connect to client on IP, port

   s.write(val_one);//add
   s.write(",");
   s.write(val_two);
   s.write(",");
   s.write(val_three);
   s.write(",");
   s.write(val_four);
   s.write("\r\n");
   delay(100); 
   
   }
  
  // Vertical line of letter "F"
  for (int i = 0; i < 150; i++){
  
  line (0, 0, 0, common_x, common_y, common_z);
  line (common_x, common_y, common_z, end_coord_x, end_coord_y, end_coord_z);
   end_coord_x = end_coord_x-1;
   thetas[i] = acos(sqrt(sq(end_coord_x) + sq(end_coord_y))/(2*joint_length));
   phis[i] = atan(-end_coord_y/end_coord_x);
   ksis[i] = atan(21/((sq(end_coord_y)+sq(end_coord_x))));
   
   int val_one = round(180*phis[i]/PI);
   int val_two = -round(180*(thetas[i])/PI);
   int val_three = -round((180 - 2*180*thetas[i]/PI));
   int val_four = -round((90+180*(thetas[i])/PI));

   s = new Client (this, "172.16.185.137",5002); // connect to client on IP, port

   s.write(val_one);//add
   s.write(",");
   s.write(val_two);
   s.write(",");
   s.write(val_three);
   s.write(",");
   s.write(val_four);
   s.write("\r\n");
   delay(100); 
   
  }
 
 
 
 
 // adjust position
  for (int i=0; i < 75; i++){
    
  line (0, 0, 0, common_x, common_y, common_z);
  line (common_x, common_y, common_z, end_coord_x, end_coord_y, end_coord_z);
   end_coord_x = end_coord_x+1;
   thetas[i] = acos(sqrt(sq(end_coord_x) + sq(end_coord_y))/(2*joint_length));
   phis[i] = atan(-end_coord_y/end_coord_x);
   ksis[i] = atan(21/((sq(end_coord_y)+sq(end_coord_x))));
   
   int val_one = round(180*phis[i]/PI);
   int val_two = -round(180*(thetas[i])/PI);
   int val_three = -round((180 - 2*180*thetas[i]/PI));
   int val_four = -round((90+180*(thetas[i])/PI));

   s = new Client (this, "172.16.185.137",5002); // connect to client on IP, port

   s.write(val_one);//add
   s.write(",");
   s.write(val_two);
   s.write(",");
   s.write(val_three);
   s.write(",");
   s.write(val_four);
   s.write("\r\n");
   delay(100); 
   
  }
  // Horizontal bottom line of letter "F"
  for (int i = 0; i < 50; i++){
    
  line (0, 0, 0, common_x, common_y, common_z);
  line (common_x, common_y, common_z, end_coord_x, end_coord_y, end_coord_z);
   end_coord_y = end_coord_y+1;
  thetas[i] = acos(sqrt(sq(end_coord_x) + sq(end_coord_y))/(2*joint_length));
   phis[i] = atan(-end_coord_y/end_coord_x);
   ksis[i] = atan(21/((sq(end_coord_y)+sq(end_coord_x))));
  
   int val_one = round(180*phis[i]/PI);
   int val_two = -round(180*(thetas[i])/PI);
   int val_three = -round((180 - 2*180*thetas[i]/PI));
   int val_four = -round((90+180*(thetas[i])/PI));

   s = new Client (this, "172.16.185.137",5002); // connect to client on IP, port
   
   s.write(val_one);//add
   s.write(",");
   s.write(val_two);
   s.write(",");
   s.write(val_three);
   s.write(",");
   s.write(val_four);
   s.write("\r\n");
   delay(100); 
   
 }
}
  times++;
  
  
  
 
}