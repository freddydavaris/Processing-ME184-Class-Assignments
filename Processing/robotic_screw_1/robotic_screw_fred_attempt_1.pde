// Used code by Casey Corado to calculate the angles. 

import processing.net.*;

float common_x, common_y, common_z; 

float joint_length = 9; 

int start_z = 12; 

int gripper = 0 ; //1 is open 0 is closed

float x = 0; 

float y = 0; 

float z = 0; 

int angle = 0; 

Client s; 



void setup() {
  

}

void draw() {
  
// **************** - - - - - Controller Manual - - - - - **************** // 
// ***************** ************************************ **************** // 
// ***************** ************************************ **************** // 



  
 if (keyPressed) {
    if (key == 'q' || key == 'Q') {
      x++;
    }
    
    else if (key == 'a' || key == 'A') {
      x--;
    }
    
     else if (key == 'w' || key == 'W') {
      y++;
    }
    
    else if (key == 's' || key == 'S') {
      y--;
    }
    
    else if (key == 'e' || key == 'E') {
      z++;
    }
    
    else if(key == 'd' || key == 'D') {
      z--;
    }
    
    else if (key == 'r' || key == 'R') {
      angle++;
    }
    
    else if (key == 'f' || key == 'F') {
      angle--;
    }
    
    else if (key == 'T' || key == 't') {
      gripper = 1; 
    }
    
    else if (key == 'G' || key == 'g') {
      gripper = 0;
    }
if (key == 'l'){
    
  println(x,y,z,angle,gripper);  //setting coordinates for the first move     
    
}

 }
 
 // **************** - - - End of Controller Manual - - - **************** // 
// ***************** ************************************ **************** // 
// ***************** ************************************ **************** // 

     
     
     
     
     
     
     
// ****************** - - - - - Control Panel - - - - - ****************** // 
if ((keyPressed == true) && (key == ' ')){
    
     setCoords(x, y, z, angle, 0);  //setting coordinates for the first move     
    
}
// ****************** - - - - end of Control Panel - - - - ****************** // 

}

  
void setCoords(float end_coord_x, float end_coord_y, float end_coord_z, int angle, int gripper) {

   s = new Client (this, "172.16.98.84",5002); // connect to client on IP, port
   
   float theta_1 = atan2(end_coord_y, end_coord_x);
   float theta_2 = calculate_theta_2(end_coord_x,end_coord_y,end_coord_z,joint_length,start_z);
   float theta_3 = calculate_theta_3(end_coord_x,end_coord_y,end_coord_z,joint_length,start_z);
   float theta_4 = -(PI/2 + calculate_theta_2(end_coord_x,end_coord_y, end_coord_z,joint_length,start_z) 
                     + calculate_theta_3(end_coord_x,end_coord_y,end_coord_z,joint_length,start_z));

   
   int val_one = round(180*theta_1/PI);
   int val_two = -round(180*theta_2/PI);
   int val_three = -round(180*theta_3/PI);
   int val_four = -round(180*theta_4/PI);
   
   s.write(val_one);
   s.write(",");
   s.write(val_two);
   s.write(",");
   s.write(val_three);
   s.write(",");
   s.write(val_four);
   s.write(",");
   s.write(angle);
   s.write(",");
   s.write(gripper);
   s.write("\r\n");
   println("Data sent is:", val_one," ",val_two," ",val_three," ",val_four," ",angle," ",gripper);
}

float calculate_theta_2(float x,float y,float z, float joint_length, float start_z) {

    float w = sqrt(sq(x) + sq(y) + sq(z-start_z));
    
    float alpha = atan2(z-start_z,sqrt(sq(x)+ sq(y)));
    
    float  temp = (sq(joint_length) - sq(joint_length) + sq(w))/(2*joint_length*w);
    
    float beta = atan2(sqrt(1-sq(temp)),temp);
    
     return (alpha + beta);
  
}

float calculate_theta_3 (float x,float y,float z, float joint_length, float start_z) {

        float w = sqrt(sq(x) + sq(y) + sq(z-start_z));

        float  temp = (sq(joint_length) + sq(joint_length) - sq(w))/(2*sq(joint_length));
        
        return atan2(sqrt(1-sq(temp)),temp); 

}