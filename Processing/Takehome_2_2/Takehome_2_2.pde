// Take-Home Freddy Davaris

import processing.net.*; 

Client client; 

int origin_x = 0; 
int origin_y = 0; 
int origin_z = 0; 

//Joint Lengths:
int L1 = 20;
int L2 = 120 ;
int L_2 = 0; //prismatic portion of joint 2 0-150
int L3 = 30;

//Angles:
float theta = 0; 
float phi = 0; 

String IP = "127.0.0.1"; //sending information using TCP to personal device
int port = 5002; 

void setup() {
  size(600,600,P3D);
  background(60, 160, 190); 
  frameRate(25);
  camera(300, 100, 300, width/2, height/2, 0, 0.0, 1.0, 0.0);
  client = new Client(this, IP, port);
}


void draw() {
    
    set_and_clear_image();
    

    // Angles 
if (keyPressed) {
    if (key == 'W' || key == 'w') {
      theta = theta + PI/180;

    }
    
    else if (key == 's' || key == 'S') {
      theta = theta - PI/180;

    }
    
     else if (key == 'a' || key == 'A') {
      phi = phi - PI/180;

    }
    
    else if (key == 'D' || key == 'd') {
      phi = phi + PI/180;

    }
    else if (key == 'r' || key == 'R') {
      L_2++;

    }
    
    else if (key == 'f' || key == 'F') {
      if (L_2 > 0) {
        
      L_2--;
      }
    }
}
    
    
    
    //joint 1 
    line(origin_x, origin_y, origin_z, origin_x, origin_y, L1); 
    
    //joint 2
    line(origin_x, origin_y, L1, x_val(L_2,theta,phi), y_val(L_2,theta,phi), z_val(L_2,theta));
    
    //joint 3
    stroke(100);
    line(x_val(L_2,theta,phi), y_val(L_2,theta,phi), z_val(L_2,theta),x_val(L_2,
    theta,phi)+ L3 *cos(phi),  y_val(L_2,theta,phi)+L3*sin(phi),
    z_val(L_2,theta));
    
    draw_grid(); 
  
    draw_building(); 
}





// Helper Functions

void draw_building(){     

      translate(185,0,15);
      box(30);
      translate(0,0,30);
      box(30);
      translate(0,0,30);
      box(30);
}


void draw_grid() {
  
  for (int i = 0; i < 20; i++) { 
      line (0,-100+20*.5*i,0,200,-100+20*.5*i,0);
      line (0+20*.5*i, -100,0,0+20*.5*i,100,0);   
  }
  
}

void set_and_clear_image() {
  
    background(60, 160, 190); 
    translate(width/2, height/2, 0); 
    rotateX(PI/2);
    rectMode(CENTER);
    rect(0, 0, 200, 200); 
    translate(-100, 0, 0);
    sphere(5);

    
}


float x_val(float L_2, float theta, float phi ) {
  return (L2 + L_2)*cos(theta)*cos(phi);
}

float y_val(float L_2, float theta, float phi ) {
  return (L2 + L_2)*cos(theta)*sin(phi);
}

float z_val(float L_2, float theta) {
  return L1 + (L2 + L_2)*sin(theta);
}