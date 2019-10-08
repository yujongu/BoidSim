class Boid {
  PVector butt;
  PVector head;
  PVector leftWing;
  PVector rightWing;
  float speed;
  PVector velocity;
  float direction;
  Boid() {
    butt = new PVector(0, 0);
    direction = random(0, 360);
    speed = random(2, 4);
  }


  void fly() {
    velocity = new PVector(cos(radians(direction)) * speed, sin(radians(direction)) * speed);
    butt.add(velocity);
    direction += random(-5, 5);
  }


  void show() {
    stroke(255);
    fill(100);
    head = new PVector(cos(radians(direction)) * 16 + butt.x, -sin(radians(direction)) * 16 - butt.y);
    leftWing = new PVector(cos(radians(direction + 90)) * 5 + butt.x, -sin(radians(direction + 90)) * 5 - butt.y);
    rightWing = new PVector(cos(radians(direction - 90)) * 5 + butt.x, -sin(radians(direction - 90)) * 5 - butt.y);
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
