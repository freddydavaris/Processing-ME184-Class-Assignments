import processing.net.*; 

Client c; 

void setup() { 
  
  // Connect to the server’s IP address and port­
  c = new Client(this, "192.168.1.3", 5002); // Replace with your server’s IP and port
} 

void draw() {         
  // sending theta, phi, length of prismatic joint
    c.write("1");
    println("yoooloo");
  }