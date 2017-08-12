Settings settings;
Asteroids asteroids;
Scene scene;

void setup() {
	settings = new Settings("settings.json");
	size( 1280, 720 );
	background(0);

	// switch this over for production
	// JSONObject json = loadJSONObject( settings.get("NASA_ENDPOINT_URL") + settings.get("NASA_API_KEY"));
	JSONObject feed = loadJSONObject("feed.json");
	FeedParser parser = new FeedParser(feed);
	asteroids = new Asteroids( parser.parseNasaFeedToAsteroidCollection() );

	scene = new Scene();

	exit(); // temporary while i'm working on data parsing
}

void keyPressed() {
	scene.handleKeyPress(key);
}
