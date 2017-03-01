void setup() {
  size(800, 600);
  background(200, 100, 100);
}

void draw() {
  float start_x = 300; 
  float start_y = 400; 
  float end_x = 500; 
  float end_y = start_y; // assume that line begins from a 0 angle.
  float angle_one = 2*PI/3; // adjust the angle to rotate line #1
  float angle_two = 0;    // adjust the angle to rotate line #2

  float[] t = rotation(angle_one, start_x, start_y, end_x, end_y);
  end_x = t[0];
  end_y = t[1];

  ellipse(300,400,10,10);//for referance
  
  println("Angle #1 is: ", 180*angle_one/PI, "degrees or ", angle_one, "radians","\n", "Angle #2 is ", 180 * angle_two/PI, "degrees or ", angle_two, "radians"); 


  float x_translation = end_x - start_x;  // changing this value will result
                                          // in the x-translation towards the 
                                          // direction needed. Note that a positive
                                          // translation will cause the line to move 
                                          // towards the right and vice versa

  float y_translation = end_y-start_y;  // changing this value will result
                                        // in the y-translation towards the 
                                        // direction needed. Note that a positive
                                        // translation will cause the line to move 
                                        // downwards and vice versa
  translation(x_translation, y_translation, start_x, start_y, end_x, end_y, angle_two);
}

float [] rotation(float angle, float start_x, float start_y, float end_x, float end_y) {

  float[] temp = new float[2];
  float line_length = sqrt((end_x - start_x)*(end_x - start_x)+
    (end_y - start_y)*(end_y - start_y)); 

  end_x = start_x + line_length*cos(angle);
  end_y = start_y - line_length*sin(angle);           
  line (start_x, start_y, end_x, end_y); 
  ellipse(end_x,end_y,10,10);//for referance
  temp[0] = end_x; // passing the new end coordinates 
  temp[1] = end_y; // in the form of an array

  return temp;
}

void translation(float x_translation, float y_translation, float start_x, 
  float start_y, float end_x, float end_y, float angle_two) {


  start_x = start_x+x_translation;
  start_y = start_y+y_translation;  // translate by reassigning
  end_x = end_x+x_translation;      // the initial coordinates
  end_y = end_y+y_translation;      // new coordinates

  rotation(angle_two, start_x, start_y, end_x, end_y); //rotation of second line
}