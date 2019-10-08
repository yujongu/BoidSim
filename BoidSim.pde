Boids[] boids = new Boids[100];

void setup(){
  size(800, 800);
  for(int i = 0; i < 100; i++){
    boids[i] = new Boids();
  }
  
}

void draw(){
  background(0);
  stroke(255);
  translate(width/2, height/2);
  for(int i = 0; i < 100; i++){
    boids[i].move();
    boids[i].show();
  }
}
