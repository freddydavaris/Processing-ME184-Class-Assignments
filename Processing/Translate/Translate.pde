
void setup() {
  size(800, 800);
  background(255);
}

void draw() {
  float start_x = 200; 
  float start_y = 400; 
  float end_x = 500; 
  float end_y = 400; 

  float x_translation = 0; // changing this value will result
                           // in the x-translation towards the 
                           // direction needed. Note that a positive
                           // translation will cause the line to move 
                           // towards the right and vice versa
                         
  float y_translation = 0; // changing this value will result
                           // in the y-translation towards the 
                           // direction needed. Note that a positive
                           // translation will cause the line to move 
                           // downwards and vice versa
  
  translation(x_translation, y_translation, start_x,
            start_y, end_x, end_y);
}

void translation(float x_translation, float y_translation, float start_x,
               float start_y, float end_x, float end_y){
                 
                 line (start_x+x_translation, start_y+y_translation,
                       end_x+x_translation, end_y+y_translation); 
                   ellipse(start_x+x_translation,start_y+y_translation,10,10);//for referance
                   ellipse(end_x+x_translation, end_y+y_translation,10,10);//for referance

}
  
  