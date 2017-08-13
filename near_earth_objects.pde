import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress remoteLocation;

Settings settings;
Performance performance;

PFont smallFont, medFont, largeFont;
color brightGreen = color(126, 211, 33);
color semiDarkGreen = color(89, 161, 6);
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
	smallFont = loadFont("HydrophiliaIced-28.vlw");
	medFont = loadFont("HydrophiliaIced-36.vlw");
	largeFont = loadFont("HydrophiliaIced-48.vlw");

	// oscP5 setup. Listening/sending on port 12000 / currently using 127.0.0.1 aka localhost
	oscP5 = new OscP5(this,12000);
	remoteLocation = new NetAddress("127.0.0.1",12000);

	// switch this over for production
	JSONObject feed = loadJSONObject( settings.get("NASA_ENDPOINT_URL") + settings.get("NASA_API_KEY"));
	// JSONObject feed = loadJSONObject("feed.json");
	FeedParser parser = new FeedParser(feed);

	performance = new Performance( new Asteroids( parser.parseNasaFeedToAsteroidCollection() ) );
}

void draw() {
	background(0);
	performance.update();
	performance.draw();
}

void keyPressed() {
	performance.handleKey();
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
