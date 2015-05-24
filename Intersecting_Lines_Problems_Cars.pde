// Global constants
private static final int SCREEN_WIDTH = 850;                   // Width of screen in pixels
private static final int SCREEN_HEIGHT = 1100;                 // Height of screen in pixels

private static final float LINE_HEIGHT = SCREEN_HEIGHT / 40;   // Height of a line (for text)

private static final float LEFT_INDENT = SCREEN_WIDTH / 20;    // Indent from left side of page

private static final int CLASSIC_INTERCEPT = 29;               // Classic Car Rentals starting cost
private static final float CLASSIC_RATE = 0.11;                // Classic Car Rentals per KM rate

private static final float BRAMPTON_RENT_CAR_1_COST = 47;        // Brampton Rent-a-Car Cost for first point
private static final float BRAMPTON_RENT_CAR_1_DISTANCE = 100;      // Brampton Rent-a-Car distance for first point
private static final float BRAMPTON_RENT_CAR_2_COST = 67;        // Brampton Rent-a-Car Cost for second point
private static final float BRAMPTON_RENT_CAR_2_DISTANCE = 350;      // Brampton Rent-a-Car distance for second point

private static final float BRAMPTON_RENT_CAR_RATE = (BRAMPTON_RENT_CAR_1_COST - BRAMPTON_RENT_CAR_2_COST) / (BRAMPTON_RENT_CAR_1_DISTANCE - BRAMPTON_RENT_CAR_2_DISTANCE);  // Brampton Rent-a-Car per KM rate
private static final float BRAMPTON_RENT_CAR_INTERCEPT = BRAMPTON_RENT_CAR_2_COST - BRAMPTON_RENT_CAR_RATE * BRAMPTON_RENT_CAR_2_DISTANCE;           // Brampton Rent-a-Car starting cost

private static final float X_AXIS_LENGTH = LEFT_INDENT*18;
private static final float Y_AXIS_LENGTH = LEFT_INDENT*8;
private static final int X_AXIS_SQUARES = 40;
private static final float SQUARE_SIZE_PIXELS = X_AXIS_LENGTH/X_AXIS_SQUARES;
private static final int Y_AXIS_SQUARES = ceil(Y_AXIS_LENGTH / SQUARE_SIZE_PIXELS);
private static final float X_AXIS_SCALE_FACTOR = X_AXIS_LENGTH / 500;
private static final float Y_AXIS_SCALE_FACTOR = Y_AXIS_LENGTH / max(CLASSIC_RATE * 500 + CLASSIC_INTERCEPT, BRAMPTON_RENT_CAR_RATE * 500 + BRAMPTON_RENT_CAR_INTERCEPT);
private static final float X_AXIS_SQUARE_VALUE = (float) 500 / X_AXIS_SQUARES;
private static final float Y_AXIS_SQUARE_VALUE = ceil(max(CLASSIC_RATE * 500 + CLASSIC_INTERCEPT, BRAMPTON_RENT_CAR_RATE * 500 + BRAMPTON_RENT_CAR_INTERCEPT) / Y_AXIS_SQUARES);
private static final float INTERSECTION_KM = (BRAMPTON_RENT_CAR_INTERCEPT - CLASSIC_INTERCEPT) / (CLASSIC_RATE - BRAMPTON_RENT_CAR_RATE);
private static final float INTERSECTION_COST = BRAMPTON_RENT_CAR_RATE * INTERSECTION_KM + BRAMPTON_RENT_CAR_INTERCEPT;

private static final String delta = new String("\u25B3");


PFont standard;    // regular type
PFont bold;    // boldface type

// Runs once
void setup() {

  println(SQUARE_SIZE_PIXELS);

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
  fill(255, 0, 0);
  text("Classic Car Rentals", LEFT_INDENT, LINE_HEIGHT * 1);
  fill(0);

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
  fill(0, 0, 255);
  text("Brampton Rent-a-Car", LEFT_INDENT, LINE_HEIGHT * 7);
  fill(0);
  textFont(standard, 14);
  text("Values: $" + String.format("%.2f", BRAMPTON_RENT_CAR_1_COST) + " for " + String.format("%.0f", BRAMPTON_RENT_CAR_1_DISTANCE) + " km, $" + String.format("%.2f", BRAMPTON_RENT_CAR_2_COST) + " for " + String.format("%.0f", BRAMPTON_RENT_CAR_2_DISTANCE) + " km.", LEFT_INDENT, LINE_HEIGHT * 8);
  text("Rate: " + delta + "y / " + delta + "x = " + String.format("(%.2f - %.2f) / (%.0f - %.0f) = %.2f", BRAMPTON_RENT_CAR_1_COST, BRAMPTON_RENT_CAR_2_COST, BRAMPTON_RENT_CAR_1_DISTANCE, BRAMPTON_RENT_CAR_2_DISTANCE, BRAMPTON_RENT_CAR_RATE), LEFT_INDENT, LINE_HEIGHT * 9);

  // Print equation for Brampton Rent-a-Car
  textFont(standard, 14);
  text("Let C be the cost, in dollars, of renting from Brampton Rent-a-Car.  Let n be the number of kilometers driven.  Then:", LEFT_INDENT, LINE_HEIGHT * 10);
  text("C = " + BRAMPTON_RENT_CAR_RATE + "n + " + String.format("%.2f", BRAMPTON_RENT_CAR_INTERCEPT), LEFT_INDENT, LINE_HEIGHT * 11);

  /*
   * Draw the graph
   */
  // Save current co-ordinate system positions 
  pushMatrix();

  // Draw axes
  translate(LEFT_INDENT * 1.5, LINE_HEIGHT * 25);  
  scale(1, -1);
  strokeWeight(2);

  // Draw vertical axis label
  pushMatrix();
  translate(LEFT_INDENT * -1.1, 0);
  rotate(radians(90));
  pushMatrix();
  scale(1, -1);
  textAlign(CENTER, CENTER);
  textFont(bold, 14);
  text("Cost in dollars", 0, LINE_HEIGHT / 2 * -1, Y_AXIS_LENGTH, LINE_HEIGHT);
  scale(1, -1);
  popMatrix();
  popMatrix();

  // Draw horizontal axis label + title
  pushMatrix();
  translate(0, LINE_HEIGHT * -1);
  pushMatrix();
  scale(1, -1);
  textAlign(CENTER, CENTER);
  textFont(bold, 14);
  text("Number of kilometres driven", 0, 0, X_AXIS_LENGTH, LINE_HEIGHT);
  scale(1, -1);
  popMatrix();
  translate(0, Y_AXIS_LENGTH + LINE_HEIGHT * 2.25);
  pushMatrix();
  scale(1, -1);
  textAlign(CENTER, CENTER);
  textFont(bold, 14);
  text("Cost in dollars vs. Number of kilometres driven", 0, 0, X_AXIS_LENGTH, LINE_HEIGHT);
  scale(1, -1);
  popMatrix();
  popMatrix();

  // x-axis
  textFont(standard, 14);
  line(0, 0, X_AXIS_LENGTH, 0);
  // Draw horizontal tick marks
  strokeWeight(1);
  for (int i = 1; i < X_AXIS_SQUARES; i ++) {
    stroke(215);
    line(i * SQUARE_SIZE_PIXELS, -5, i * SQUARE_SIZE_PIXELS, Y_AXIS_LENGTH);  // Grid line
    stroke(0);
    line(i * SQUARE_SIZE_PIXELS, -5, i * SQUARE_SIZE_PIXELS, 5);              // Tick marks
    // Draw scale values every other tick mark
    if (i % 2 == 0) {
      pushMatrix();
      scale(1, -1);
      text(String.format("%-3.0f", i * X_AXIS_SQUARE_VALUE), i * SQUARE_SIZE_PIXELS, SQUARE_SIZE_PIXELS * 1);  
      scale(1, -1);
      popMatrix();
    }
  }

  // y -axis
  strokeWeight(2);
  line(0, 0, 0, Y_AXIS_LENGTH);
  // Draw vertical tick marks and grid
  strokeWeight(1);
  for (int i = 1; i < Y_AXIS_SQUARES; i ++) {
    stroke(215);
    line(-5, i * SQUARE_SIZE_PIXELS, X_AXIS_LENGTH, i * SQUARE_SIZE_PIXELS);    // Grid line
    stroke(0);
    line(-5, i * SQUARE_SIZE_PIXELS, 5, i * SQUARE_SIZE_PIXELS);                // Tick marks
    pushMatrix();
    scale(1, -1);
    text(String.format("%-3.0f", i * Y_AXIS_SQUARE_VALUE), SQUARE_SIZE_PIXELS * 0.75 * -1, i * SQUARE_SIZE_PIXELS * -1);  
    scale(1, -1);
    popMatrix();
  }
  strokeWeight(1);
  rectMode(CENTER);

  // Draw Classic Car Rentals line
  strokeWeight(2);
  stroke(255, 0, 0);                                                          
  line(0, CLASSIC_INTERCEPT * Y_AXIS_SCALE_FACTOR, 500 * X_AXIS_SCALE_FACTOR, (CLASSIC_RATE * 500 + CLASSIC_INTERCEPT) * Y_AXIS_SCALE_FACTOR);

  // Draw Classic Car Rental points
  noStroke();
  fill(255, 0, 0);
  ellipse(150 * X_AXIS_SCALE_FACTOR, (CLASSIC_RATE * 150 + CLASSIC_INTERCEPT) * Y_AXIS_SCALE_FACTOR, 8, 8);
  ellipse(350 * X_AXIS_SCALE_FACTOR, (CLASSIC_RATE * 350 + CLASSIC_INTERCEPT) * Y_AXIS_SCALE_FACTOR, 8, 8);
  ellipse(500 * X_AXIS_SCALE_FACTOR, (CLASSIC_RATE * 500 + CLASSIC_INTERCEPT) * Y_AXIS_SCALE_FACTOR, 8, 8);

  // Draw Brampton Rent-a-Car line
  stroke(0, 0, 255);                                                          
  line(0, BRAMPTON_RENT_CAR_INTERCEPT * Y_AXIS_SCALE_FACTOR, 500 * X_AXIS_SCALE_FACTOR, (BRAMPTON_RENT_CAR_RATE * 500 + BRAMPTON_RENT_CAR_INTERCEPT) * Y_AXIS_SCALE_FACTOR);

  // Draw Brampton Rent-a-Car points
  noStroke();
  fill(0, 0, 255);
  ellipse(BRAMPTON_RENT_CAR_1_DISTANCE * X_AXIS_SCALE_FACTOR, BRAMPTON_RENT_CAR_1_COST * Y_AXIS_SCALE_FACTOR, 8, 8);
  ellipse(BRAMPTON_RENT_CAR_2_DISTANCE * X_AXIS_SCALE_FACTOR, BRAMPTON_RENT_CAR_2_COST * Y_AXIS_SCALE_FACTOR, 8, 8);

  // Draw
  stroke(0, 255, 0);
  strokeWeight(1);
  line(INTERSECTION_KM * X_AXIS_SCALE_FACTOR, 0, INTERSECTION_KM * X_AXIS_SCALE_FACTOR, INTERSECTION_COST * Y_AXIS_SCALE_FACTOR);
  line(0, INTERSECTION_COST * Y_AXIS_SCALE_FACTOR, INTERSECTION_KM * X_AXIS_SCALE_FACTOR, INTERSECTION_COST * Y_AXIS_SCALE_FACTOR);


  // Restore current co-ordinate system positions
  popMatrix();

  /*
   * State intersection point
   */
  textAlign(LEFT);
  textFont(bold, 14);
  fill(0);
  text("Intersection Point", LEFT_INDENT, LINE_HEIGHT * 28);
  textFont(standard, 14);
  text("After " + String.format("%.2f", INTERSECTION_KM) + " km, the cost of using each rental car company is the same, at $" + String.format("%.2f", INTERSECTION_COST) + ".", LEFT_INDENT, LINE_HEIGHT * 29);
}

// Runs repeatedly
void draw() {
  if (keyPressed == true && key == 's') {
    saveFrame("output.png");
  }
}
