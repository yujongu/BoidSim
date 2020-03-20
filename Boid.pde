class Boid {
  PVector butt;
  PVector head;
  PVector leftWing;
  PVector rightWing;
  float speed;
  PVector velocity;
  PVector acceleration;
  Boid() {
    butt = new PVector(random(-width/2, width/2), random(-height/2, height/2));
    velocity = new PVector(random(-2, 2), random(-2, 2));
    //butt = new PVector(0, 0);
    //velocity = new PVector(2, 2);
    acceleration = new PVector(0, 0);
  }

  void fly() {
    
    velocity = velocity.add(acceleration);
    velocity.limit(2);
    butt = butt.add(velocity);
    acceleration = new PVector(0, 0);
    
  }


  void show() {
    stroke(255);
    fill(100);
    float direction = degrees(atan(velocity.y/velocity.x));
    if(velocity.x >= 0){
      head = new PVector(cos(radians(direction)) * 16 + butt.x, -sin(radians(direction)) * 16 - butt.y);
      leftWing = new PVector(cos(radians(direction + 90)) * 5 + butt.x, -sin(radians(direction + 90)) * 5 - butt.y);
      rightWing = new PVector(cos(radians(direction - 90)) * 5 + butt.x, -sin(radians(direction - 90)) * 5 - butt.y);
    } else {
      head = new PVector(-cos(radians(direction)) * 16 + butt.x, sin(radians(direction)) * 16 - butt.y);
      leftWing = new PVector(cos(radians(direction + 90)) * 5 + butt.x, -sin(radians(direction + 90)) * 5 - butt.y);
      rightWing = new PVector(cos(radians(direction - 90)) * 5 + butt.x, -sin(radians(direction - 90)) * 5 - butt.y);
    }
    
    triangle(head.x, head.y, leftWing.x, leftWing.y, rightWing.x, rightWing.y);
    circleAround();
  }

  void circleAround() {
    if (butt.x > width/2 + 10) {
      butt.x = -width/2 - 10;
    } else if (butt.x < -width/2 - 10) {
      butt.x = width/2 + 10;
    }
    if (butt.y > height/2 + 10) {
      butt.y = -height/2 - 10;
    } else if (butt.y < -height/2 - 10) {
      butt.y = height/2 + 10;
    }
  }
}
