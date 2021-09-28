class Rotator {
  float theta = 0;
  float radius = 1;
  int order = 0;
  float arrow_x;
  float arrow_y;

  Rotator(float coef_radius, float coef_theta, int n) {
    this.theta = coef_theta;
    this.radius = scaling*coef_radius;
    this.order = n;
  }

  void display() {
    noFill();
    stroke(0);
    circle(0, 0, 2*this.radius);
    arrow_x = this.radius*cos(radians(this.theta)*this.order);
    arrow_y = this.radius*sin(radians(this.theta)*this.order);
    line(0, 0, arrow_x, arrow_y);
    translate(arrow_x, arrow_y);
  }

  void go_brrrr() {
    this.theta -= speed_scale;
  }
  
}
