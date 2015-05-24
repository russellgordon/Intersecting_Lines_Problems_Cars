// Global constants
private static final int SCREEN_WIDTH = 850;                   // Width of screen in pixels
private static final int SCREEN_HEIGHT = 1100;                 // Height of screen in pixels

private static final float LINE_HEIGHT = SCREEN_HEIGHT / 40;   // Height of a line (for text)

private static final float LEFT_INDENT = SCREEN_WIDTH / 20;    // Indent from left side of page

private static final int CLASSIC_INTERCEPT = 29;               // Classic Car Rentals starting cost
private static final float CLASSIC_RATE = 0.11;                // Classic Car Rentals per KM rate

private static final float BRAMPTON_RENT_CAR_COST_100 = 47;        // Brampton Rent-a-Car Cost for 100 km
private static final float BRAMPTON_RENT_CAR_COST_350 = 67;        // Brampton Rent-a-Car Cost for 350 km
private static final float BRAMPTON_RENT_CAR_RATE = (BRAMPTON_RENT_CAR_COST_100 - BRAMPTON_RENT_CAR_COST_350) / (100 - 350);  // Brampton Rent-a-Car per KM rate
private static final float BRAMPTON_RENT_CAR_INTERCEPT = BRAMPTON_RENT_CAR_COST_350 - BRAMPTON_RENT_CAR_RATE * 350;           // Brampton Rent-a-Car starting cost

private static final String delta = new String("\u25B3");


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

  // Section title
  textFont(bold, 14);
  text("Classic Car Rentals", LEFT_INDENT, LINE_HEIGHT * 1);

  // Print equation for Classic Car Rentals
  textFont(standard, 14);
  text("Let C be the cost, in dollars, of renting from Classic Car Rentals.  Let n be the number of kilometers driven.  Then:", LEFT_INDENT, LINE_HEIGHT * 2);
  text("C = " + CLASSIC_RATE + "n + " + CLASSIC_INTERCEPT, LEFT_INDENT, LINE_HEIGHT * 3);

  // Print table of values for Classic Car Rentals
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
  
  // Show rate calculation for Brampton Rent-a-Car
  textFont(bold, 14);
  text("Brampton Rent-a-Car", LEFT_INDENT, LINE_HEIGHT * 7);
  textFont(standard, 14);
  text("Rate: " + delta + "y / " + delta + "x = " + String.format("(%.2f - %.2f) / (350 - 100) = %.2f", BRAMPTON_RENT_CAR_COST_350, BRAMPTON_RENT_CAR_COST_100, BRAMPTON_RENT_CAR_RATE), LEFT_INDENT, LINE_HEIGHT * 8);

  // Print equation for Brampton Rent-a-Car
  textFont(standard, 14);
  text("Let C be the cost, in dollars, of renting from Brampton Rent-a-Car.  Let n be the number of kilometers driven.  Then:", LEFT_INDENT, LINE_HEIGHT * 9);
  text("C = " + BRAMPTON_RENT_CAR_RATE + "n + " + String.format("%.2f", BRAMPTON_RENT_CAR_INTERCEPT), LEFT_INDENT, LINE_HEIGHT * 10);
  

}

// Runs repeatedly
void draw() {
}
