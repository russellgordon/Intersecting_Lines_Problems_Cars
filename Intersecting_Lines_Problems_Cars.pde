// Global variables
private static final int SCREEN_WIDTH = 850;                   // Width of screen in pixels
private static final int SCREEN_HEIGHT = 1100;                 // Height of screen in pixels

private static final float LINE_HEIGHT = SCREEN_HEIGHT / 40;   // Height of a line (for text)

private static final float LEFT_INDENT = SCREEN_WIDTH / 20;    // Indent from left side of page

private static final int CLASSIC_INTERCEPT = 29;               // Classic Car Rentals starting cost
private static final float CLASSIC_RATE = 0.11;                // Classic Car Rentals per KM rate

PFont standard;    // regular type
PFont bold;    // boldface type

// Runs once
void setup() {

  // Make canvas letter paper-sized
  size(SCREEN_WIDTH, SCREEN_HEIGHT);

  // Page appearance
  background(255);      // White background
  fill(0);              // Black text  

  // Create fonts to use later
  standard = loadFont("Helvetica-14.vlw");      // Helvetica, regular
  bold = loadFont("Helvetica-Bold-14.vlw");     // Helvetica, boldface

  // Print equation for Classic Car Rentals
  textFont(standard, 14);
  text("Let C be the cost, in dollars, of renting from Classic Car Rentals.  Let n be the number of kilometers driven.  Then:", LEFT_INDENT, LINE_HEIGHT * 2);
  text("C = " + CLASSIC_RATE + "n + " + CLASSIC_INTERCEPT, LEFT_INDENT, LINE_HEIGHT * 3);

  // Print table of values
  textFont(bold, 14);
  text("Distance", LEFT_INDENT * 5, LINE_HEIGHT * 3);
  text("Cost", LEFT_INDENT * 7, LINE_HEIGHT * 3);
  textFont(standard, 14);
  text("150", LEFT_INDENT * 5, LINE_HEIGHT * 4);
  text("350", LEFT_INDENT * 5, LINE_HEIGHT * 5);
  text("500", LEFT_INDENT * 5, LINE_HEIGHT * 6);
  
  text("$" + String.format("%.2f", CLASSIC_RATE * 150 + CLASSIC_INTERCEPT), LEFT_INDENT * 7, LINE_HEIGHT * 4);
  text("$" + String.format("%.2f", CLASSIC_RATE * 350 + CLASSIC_INTERCEPT), LEFT_INDENT * 7, LINE_HEIGHT * 5);
  text("$" + String.format("%.2f", CLASSIC_RATE * 500 + CLASSIC_INTERCEPT), LEFT_INDENT * 7, LINE_HEIGHT * 6);
}

// Runs repeatedly
void draw() {
}
