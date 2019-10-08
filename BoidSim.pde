ArrayList<Boid> flock = new ArrayList<Boid>();
int boidCount = 30;
void setup() {
  size(800, 800);
  for (int i = 0; i < boidCount; i++) {
    flock.add(new Boid());
  }
}

void draw() {
  background(0);
  stroke(255);
  translate(width/2, height/2);
  for (int i = 0; i < flock.size(); i++) {
    flock.get(i).fly();
    flock.get(i).show();
  }
}

/*
  
   separation: steer to avoid crowding local flockmates
   
   alignment: steer towards the average heading of local flockmates
   
   cohesion: steer to move towards the average position (center of mass) 
   of local flockmatesseparation: steer to avoid crowding local flockmates
   
   */
   
  void separation(){
    
  }
  
  void alignment(){
    
  }
  
  void cohesion(){
    
  }
