ArrayList<Boid> flock = new ArrayList<Boid>();
int boidCount = 100;
int boidFoV = 50;
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
  for (Boid a : flock) {
    separation(a);
    alignment(a);
    cohesion(a);
    a.fly();
    a.show();
  }
}

/*
  
 separation: steer to avoid crowding local flockmates
 
 alignment: steer towards the average heading of local flockmates
 
 cohesion: steer to move towards the average position (center of mass) 
 of local flockmatesseparation: steer to avoid crowding local flockmates
 
 */

void separation(Boid b) {
  PVector avgD = new PVector(0, 0);
  PVector dir = new PVector(0, 0);
  float dist = 0;
  float count = 0;
  for(Boid a : flock){
    if(PVector.dist(a.butt, b.butt) > 0 && PVector.dist(a.butt, b.butt) < 25){
      dist = PVector.dist(a.butt, b.butt);
      dir = PVector.sub(b.butt, a.butt);
      dir.div(dist);
      avgD.add(dir);
      count++;
    }
  }
  if(count > 0){
    if(avgD.div(count).mag() > 0){
      avgD.normalize().mult(2);
      PVector force = PVector.sub(avgD, b.velocity);
      force.limit(0.05);
      b.acceleration.add(force);
    }
  }
}

void alignment(Boid b) {
  PVector avgV = new PVector(0, 0);
  float count = 0;
  for(Boid a : flock){
    if(PVector.dist(b.butt, a.butt) < boidFoV){
      avgV.add(a.velocity);
      count++;
    }
  }
  if(count > 0){
    avgV.div(count);
    avgV.normalize().mult(2);
    PVector force = PVector.sub(avgV, b.velocity);
    force.limit(0.05);
    b.acceleration.add(force);
  }
}

void cohesion(Boid b) {
  PVector avgP = new PVector(0, 0);
  float count = 0;
  for(Boid a : flock){
    if(PVector.dist(a.butt, b.butt) > 0 && PVector.dist(b.butt, a.butt) < 25){
      avgP.add(a.butt);
      count++;
    }
  }
  if(count > 0){
    avgP.div(count);
    PVector force = PVector.sub(avgP, b.butt);
    force.normalize();
    force.mult(2);
    force.sub(b.velocity);
    force.limit(0.01);
    b.acceleration.add(force);
  }
  
}
