Settings settings;
Asteroids asteroids;
Performance performance;

void setup() {
	settings = new Settings("settings.json");
	size( 1280, 720 );
	background(0);

	// switch this over for production
	// JSONObject json = loadJSONObject( settings.get("NASA_ENDPOINT_URL") + settings.get("NASA_API_KEY"));
	JSONObject feed = loadJSONObject("feed.json");
	FeedParser parser = new FeedParser(feed);
	asteroids = new Asteroids( parser.parseNasaFeedToAsteroidCollection() );

	performance = new Performance();
}

void draw() {
	background(0);
	performance.update();
	performance.draw();
}

void keyPressed() {
	performance.handleKey(key);
}
