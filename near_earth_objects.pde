Settings settings;
Performance performance;

PFont medFont, largeFont;
color brightGreen = color(126, 211, 33);
color darkGreen = color(65, 117, 5);

// x and y calculations are based on comps
// modeled after responsive design
// should allow for flexible screen size
final float WIDTH_1080P = 1920.0;
final float HEIGHT_1080P = 1080.0;

// to be able to easily offset new lines in text
final int MEDIUM_LINE_HEIGHT = 49;

void setup() {
	settings = new Settings("settings.json");
	size( 1920, 1080 );
	background(0);
	medFont = loadFont("HydrophiliaIced-36.vlw");
	largeFont = loadFont("HydrophiliaIced-48.vlw");

	// switch this over for production
	// JSONObject json = loadJSONObject( settings.get("NASA_ENDPOINT_URL") + settings.get("NASA_API_KEY"));
	JSONObject feed = loadJSONObject("feed.json");
	FeedParser parser = new FeedParser(feed);

	performance = new Performance( new Asteroids( parser.parseNasaFeedToAsteroidCollection() ) );
}

void draw() {
	background(0);
	performance.update();
	performance.draw();
}

void keyPressed() {
	performance.handleKey(key);
	if (key == ESC) {
		key = 0;
	}
}

float calculateXForItemAt(int value) {
	return width * ( (float)value / WIDTH_1080P);
}

float calculateYForItemAt(int value) {
	return height * ( (float)value / HEIGHT_1080P);
}
