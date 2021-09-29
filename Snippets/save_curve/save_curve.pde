int i =0;

ArrayList<Point> draw_points = new ArrayList<Point>();

JSONArray storage;

void setup() {
  size(800, 600);
  storage = new JSONArray();
}

void draw() {
  background(255);
  if (mousePressed) {

    fill(0);
    text(i, width/2, height/2);
    Point mouse = new Point(mouseX, mouseY);
    draw_points.add(mouse);
    JSONObject point = new JSONObject();    
    i++;
  }
  plot_curve(draw_points);
}

void keyPressed() {
  if (key == 's') {
    for (int i = 0; i < draw_points.size(); i++) {

      JSONObject point = new JSONObject();

      point.setFloat("x", draw_points.get(i).x);
      point.setFloat("y", draw_points.get(i).y);

      storage.setJSONObject(i, point);
    }
    saveJSONArray(storage, "data/new.json");
  }
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

void plot_curve(ArrayList<Point> points) {
  // red stroke
  stroke(#FF0000);
  // connect each point in points with its successor
  for (int i = 0; i < points.size()-1; i++) {
    Point p1 = points.get(i);
    Point p2 = points.get(i+1);
    line(p1, p2);
  }
}
