class Boids{
  float x;
  float y;
  float direction;
  Boids(){
    x = 0;
    y = 0;
    direction = random(0, 360);
  }
  void move(){
    
  }
  void show(){
    stroke(255);
    noFill();
    triangle(x, y, x + 5, y - 16, x + 10, y);
  }
}
