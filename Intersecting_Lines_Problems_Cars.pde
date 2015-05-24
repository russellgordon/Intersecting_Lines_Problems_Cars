// Global variables
private static final int SCREEN_WIDTH = 850;                   // Width of screen in pixels
private static final int SCREEN_HEIGHT = 1100;                 // Height of screen in pixels

private static final float LINE_HEIGHT = SCREEN_HEIGHT / 40;   // Height of a line (for text)

private static final float LEFT_INDENT = SCREEN_WIDTH / 20;    // Indent from left side of page

private static final float CLASSIC_INTERCEPT = 29;             // Classic Car Rentals starting cost
private static final float CLASSIC_RATE = 0.11;                // Classic Car Rentals per KM rate



PFont standard;    // Regular sentence

// Runs once
void setup() {

    // Make canvas letter paper-sized
    size(SCREEN_WIDTH, SCREEN_HEIGHT);
    
    // White background
    background(255);
    
    // Text options
    fill(0);                                      // Black text  
    standard = loadFont("Helvetica-14.vlw");      // Helvetica
    textFont(standard, 14);
    
    // Print equation for Classic Car Rentals
    text("Let C be the cost, in dollars, of renting from Classic Car Rentals.  Let n be the number of kilometers driven.  Then:", LEFT_INDENT, LINE_HEIGHT * 2);
}

// Runs repeatedly
void draw() {
  
}
