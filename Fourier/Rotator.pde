class Rotator {
  float theta = 0;
  float radius = 1;
  int order = 0;
  float arrow_x;
  float arrow_y;
  color colour;

  Rotator(float coef_radius, float coef_theta, int n) {
    this.theta = coef_theta;
    this.radius = scaling*coef_radius;
    this.order = n;
    this.colour = randomColor();
  }

  void display() {
    noFill();
    stroke(this.colour, 60);
    circle(0, 0, 2*this.radius);

    // arrow end coordinates
    arrow_x = this.radius*cos(radians(this.theta)*this.order);
    arrow_y = this.radius*sin(radians(this.theta)*this.order);

    // draw line to end of arrow, translate there
    stroke(this.colour, 255);
    line(0, 0, arrow_x, arrow_y);
    translate(arrow_x, arrow_y);

    // draw the arrow head
    pushMatrix();
    rotate(radians(this.theta)*this.order);

    // v style
    //line(0, 0, 10*cos(radians(150)), 10*sin(radians(150)));
    //line(0, 0, 10*cos(radians(150)), -10*sin(radians(150)));

    // Filled triangle
    fill(this.colour, 255);
    triangle(10*cos(radians(150)), 10*sin(radians(150)), 
      0, 0, 
      10*cos(radians(150)), -10*sin(radians(150)));
    popMatrix();
  }

  void go_brrrr() {
    this.theta -= speed_scale;
  }
}
