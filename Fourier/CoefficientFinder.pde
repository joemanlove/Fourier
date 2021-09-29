// In order to find the coefficients for the fourier transfor of a curve in the plane
// c_n = int_0^1 f(t)e^{-n2\pi t}dt 
// this works because only the constant term has a nonzero average
// suppose we have a curve f(t) defined by an array of P points indexed by the number p, each of the form p -> x(p)+ i*y(p)
// maybe have to go there and back again?
// int_0^1 f(t)e^{-n2\pi t}dt
// ~ sum_p (x(p)+iy(p))(e^{-2n\pi p/P})*1/P
// =  sum_p (x(p)+iy(p))((cos(-2n\pi p/P)+ i * (sin(-2n\pi p/P)))*1/P
// = sum_p {x(p)*(cos(-2n\pi p/P) - y(p) * sin(-2n\pi p/P) + i[ y(p)*(cos(-2n\pi p/P) + x(p) * (sin(-2n\pi p/P))]}/P
// So realPart = sum_p [x(p)*(cos(-2n\pi p/P) - y(p) * sin(-2n\pi p/P)]/P
// imagPart = sum_p [ y(p)*(cos(-2n\pi p/P) + x(p) * (sin(-2n\pi p/P))]/P
// radius = dist(0,0,realPart,imagPart)
// theta = atan2(imagPart, realPart)

Point findCoefficient(int n) {
  int P = goal_points.size();
  float realPart =0;
  float imagPart =0;
  for (int p =0; p<P; p++) {
    realPart += goal_points.get(p).x*cos(-2*n*PI*p/P) - goal_points.get(p).y * sin(-2*n*PI* p/P);
    imagPart += goal_points.get(p).y*cos(-2*n*PI*p/P) + goal_points.get(p).x * sin(-2*n*PI* p/P);
  }
  realPart = realPart/P;
  imagPart = imagPart/P;
  println(realPart);
  println(imagPart);
  return new Point(dist(0,0,realPart,imagPart), atan2(imagPart, realPart));
}

void loadGoalPoints() {
  JSONArray items;
  items = loadJSONArray("s1.json");

  for (int i = 0; i < items.size(); i++) {

    JSONObject point = items.getJSONObject(i); 


    int x = point.getInt("x");
    int y = point.getInt("y");

    goal_points.add(new Point(x, y));
    //println(x + ", " + y);
  }
}
