void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  float start_x = 200; 
  float start_y = 300; 
  float end_x = 400; 
  float end_y = start_y; // assume that line begins from a 0 angle.
  float angle = .9; // adjust the angle to rotate the line
  rotation(angle, start_x, start_y, end_x, end_y); 
  ellipse(200,300,10,10);//for referance
}

void rotation(float angle, float start_x, float start_y, float end_x, float end_y){
  
  float line_length = sqrt((end_x - start_x)*(end_x - start_x)+
                           (end_y - start_y)*(end_y - start_y)); 
                        
    end_x = start_x + line_length*cos(angle);
    end_y = start_y - line_length*sin(angle);           
    
    line (start_x, start_y, end_x, end_y); 
    ellipse(start_x, start_y,10,10);
    ellipse(end_x, end_y, 10,10);
}
  
  