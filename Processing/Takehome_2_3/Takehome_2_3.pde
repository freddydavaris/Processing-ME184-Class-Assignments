// Take-Home Freddy Davaris


boolean checkpoint_1 = false; 
boolean checkpoint_2 = false; 
boolean checkpoint_3 = false; 
boolean checkpoint_4 = false;

int origin_x = 0; 
int origin_y = 0; 
int origin_z = 0; 

//Joint Lengths:
int L1 = 20;
int L2 = 100 ;
int L_2 = 0; //prismatic portion of joint 2 0-150
int L3 = 30;

//Angles:
float theta = 0; 
float phi = 0; 

String IP = "127.0.0.1"; //sending information using TCP to personal device
int port = 5002; 

void setup() {
  size(600, 600, P3D);
  background(60, 160, 190); 
  camera(300, 100, 300, width/2, height/2, 0, 0.0, 1.0, 0.0);
}


void draw() {
  
  set_and_clear_image();

  // Set motion
 
  if (theta< 0.10925268 && checkpoint_1 == false ){
    theta = theta + 0.002;
  }
  if (phi< 0.5555852 && checkpoint_2 == false ){
    phi = phi + 0.002;
  }
  if (L_2< 19 && checkpoint_3 == false ){
    L_2++;
  }
  println(theta, phi, L_2);
  //if (theta == 0.21000007) {
  //  checkpoint_1 = true;
  //}
  
  // if (phi == 0.65599865) {
  //  checkpoint_2 = true;
  //}
  
  // if (L_2 == 25) {
  //  checkpoint_3  = true;
  //}
  
  //if (checkpoint_1 == true &&
  //    checkpoint_2 == true &&
  //    checkpoint_3 == true){
  //    if (phi > 0.000){
  //      phi = phi - 0.002;
  //    }
  //    if (theta > 0.000) {
  //      theta = theta - 0.002; 
  //    }
//}
//
  
  
  //joint 1 
  line(origin_x, origin_y, origin_z, origin_x, origin_y, L1); 

  //joint 2
  line(origin_x, origin_y, L1, x_val(L_2, theta, phi), y_val(L_2, theta, phi), z_val(L_2, theta));

  //joint 3
  line(x_val(L_2, theta, phi), y_val(L_2, theta, phi), z_val(L_2, theta), x_val(L_2, 
    theta, phi)+ L3 *cos(phi), y_val(L_2, theta, phi)+L3*sin(phi), 
    z_val(L_2, theta));

  draw_grid(); 

  draw_building();

}





// Helper Functions

void draw_building() {     

  translate(185, 0, 15);
  box(30);
  translate(0, 0, 30);
  box(30);
  translate(0, 0, 30);
  box(30);
  translate(-60, 50, -68);
  box(15);
}


void draw_grid() {

  for (int i = 0; i < 20; i++) { 
    line (0, -100+20*.5*i, 0, 200, -100+20*.5*i, 0);
    line (0+20*.5*i, -100, 0, 0+20*.5*i, 100, 0);
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


float x_val(float L_2, float phi, float theta ) {
  return (L2 + L_2)*cos(theta)*cos(phi);
}

float y_val(float L_2, float theta, float phi ) {
  return (L2 + L_2)*cos(theta)*sin(phi);
}

float z_val(float L_2, float theta) {
  return L1 + (L2 + L_2)*sin(theta);
}