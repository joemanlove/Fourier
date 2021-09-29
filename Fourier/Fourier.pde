// rotators store all the vector information for each order
ArrayList<Rotator> rotators = new ArrayList<Rotator>();

// scaling factor, the size of a unit in pixels
int scaling = 1;

// sclaing for speed, .3 is good and slow, 1 is mega quick (degrees turned per frame)
float speed_scale = .4;

// number of vectors
// MUST BE ODD
int num_vectors = 11;

// points stores all the points that the end of the last vector has been to
ArrayList<Point> points = new ArrayList<Point>();

// goal_points displays the curve we're approximating
ArrayList<Point> goal_points = new ArrayList<Point>();

void setup() {
  // window dressing
  size(800, 600);
  background(255);
  
  
  loadGoalPoints();
  
  // n is the order of the term in the Fourier Series, 
  int n = 0;
  // colors for the rotators, each pair in the same order are matching colors.
  color colour = randomColor();

  // initialize rotator array in sequence 0, -1, 1, -2, 2, -3, 3, ...
  for (int i=0; i < num_vectors; i++) {
    if (i % 2 == 0) {
      //rotators.add(new Rotator(random(.2, 1.2), random(360), n, colour));
      Point coef = findCoefficient(n);
      print(degrees(coef.y));
      rotators.add(new Rotator(coef.x, coef.y, n, colour));
    } else {
      n++;
      colour = randomColor();
      Point coef = findCoefficient(-n);
      rotators.add(new Rotator(coef.x, degrees(coef.y), n, colour));
      //rotators.add(new Rotator(random(.2, 1.2), random(360), -1*n, colour));
    }
  }


  translate(width/2, height/2);
}

void draw() {
  // background wipe
  background(255);

  // center the origin
  translate(width/2, height/2);

  // temporary coordinates for the rotators
  pushMatrix();

  // keeping track of the x,y positions of the last arrow
  float x =0;
  float y =0;

  // go through the arraylist of rotators
  for (int i=0; i<num_vectors; i++) {
    Rotator current = rotators.get(i);
    // draw it, make it move
    current.display();
    current.go_brrrr();

    // update positions
    x += current.arrow_x;
    y += current.arrow_y;

    // the last one gets added to the list of visited points
    if (i == num_vectors - 1) {
      points.add(new Point(x, y));
    }
  }
  // remove temp coordinates
  popMatrix();

  // plot our shape
  plot_curve(points, #0000FF);

  //plot the goal
  plot_curve(goal_points, #00FF00);
}
