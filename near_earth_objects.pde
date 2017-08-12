Settings settings;
Performance performance;

PFont medFont, largeFont;
color brightGreen = color(126, 211, 33);
color darkGreen = color(65, 117, 5);

final float width1080p = 1920.0;
final float height1080p = 1080.0;

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
}
