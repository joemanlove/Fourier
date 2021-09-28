// rotators store all the vector information for each order
ArrayList<Rotator> rotators = new ArrayList<Rotator>();

// scaling factor, the size of a unit in pixels
int scaling = 50;

// sclaing for speed, .3 is good and slow, 1 is mega quick (degrees turned per frame)
float speed_scale = .7;

// number of vectors
// MUST BE ODD
int num_vectors = 25;

// points stores all the points that the end of the last vector has been to
ArrayList<Point> points = new ArrayList<Point>();

void setup() {
  // window dressing
  size(800, 600);
  background(255);

  //based on the number of vectors, calculate orders
  int orders = (num_vectors-1)/2;

  // initialize rotator array
  for (int i=-1* orders; i <= orders; i++) {

    // add new rorators with random radii, random initial angle, and order i
    rotators.add(new Rotator(random(.2, 1.2), random(360), i));
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
    if(i == num_vectors - 1){
      points.add(new Point(x, y));
    }
  }
  // remove temp coordinates
  popMatrix();
  
  // plot our shape
  plot_curve(points);
  
}
