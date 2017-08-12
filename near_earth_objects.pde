Settings settings;

void setup() {
	settings = new Settings("settings.json");
	size( 1280, 720 );
	background(0);
	JSONObject json = loadJSONObject( settings.get("NASA_ENDPOINT_URL") + settings.get("NASA_API_KEY")) ;

	exit(); // temporary while i'm working on data parsing
}
