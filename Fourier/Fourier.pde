//Rotator test;
//Rotator test_2;
//Rotator test_3;
ArrayList<Rotator> rotators = new ArrayList<Rotator>();
int scaling = 50;


void setup() {
  size(800, 600);
  background(255);
  //test = new Rotator(1,0,1);
  //test_2 = new Rotator(.75,30,3);
  //test_3 = new Rotator(.63,-135,4);
  float[] radii = new float[10];
  for (int i=0; i<10; i++) {
    radii[i] = random(.1, 2);
  }
  radii = reverse(sort(radii));
  for (int i=0; i<10; i++) {
    rotators.add(new Rotator(radii[i], random(360), int(random(-20,20))));
  } 

  translate(width/2, height/2);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  for (int i=0; i<10; i++) {
    Rotator current = rotators.get(i);
    current.display();
    current.go_brrrr();
  }
  //test.display();
  //test.go_brrrr();
  //test_2.display();
  //test_2.go_brrrr();
  //test_3.display();
  //test_3.go_brrrr();
}
