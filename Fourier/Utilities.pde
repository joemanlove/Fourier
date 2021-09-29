color randomColor(){
  return color(random(235), random(235), random(235));
}

class Point {
  float x;
  float y;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

void line(Point p1, Point p2) {
  line(p1.x, p1.y, p2.x, p2.y);
}

void plot_curve(ArrayList<Point> points, color colour) {
  // red stroke
  stroke(colour);
  // connect each point in points with its successor
  for (int i = 0; i < points.size()-1; i++) {
    Point p1 = points.get(i);
    Point p2 = points.get(i+1);
    line(p1, p2);
  }
}
