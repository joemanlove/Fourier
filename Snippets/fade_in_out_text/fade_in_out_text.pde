// fadein/fadeout text
// Joe Manlove
// created 10/2/21

// Goal - a demonstration of text fading in and out using the principle of bouncing

// opacity is the opposite of transparency, 255 is not transparent and 0 is transparent
int opacity = 255;

// stepsize controls the rate at which text fades in and out, keep this less than 20 or so.
int stepsize = 3;

// the background color for use throughout
color bg_color;

void setup(){
  size(800,600);
  
  // randomize the background color
  bg_color = color(int(random(255)),int(random(255)),int(random(255)));
  
  // align text by center and set size to 100 px
  textAlign(CENTER, CENTER);
  textSize(100);
}

void draw(){
  // background wipe
  background(bg_color);
  
  // render text in black with opacity
  fill(0,0,0, opacity);
  text("TESTING...", width/2, height/2);
  
  // change opacity by stepsize
  opacity = opacity + stepsize;
  
  // The following bounces opacity between 0 and 255
  // if opacity goes over 255, set to 255 and reverse direction
  if(opacity > 255){
    opacity = 255;
    stepsize = -1 * stepsize;
  }
  // if opacity goes below 0, set to 0 and reverse direction
  if(opacity < 0){
    opacity = 0;
    stepsize = -1 * stepsize;
  }
}
