import java.util.Iterator;

Settings settings;
Asteroids asteroids;

void setup() {
	settings = new Settings("settings.json");
	size( 1280, 720 );
	background(0);
	// JSONObject json = loadJSONObject( settings.get("NASA_ENDPOINT_URL") + settings.get("NASA_API_KEY"));
	JSONObject json = loadJSONObject("feed.json");
	asteroids = new Asteroids( cleanNasaJson(json) );
	exit(); // temporary while i'm working on data parsing
}

JSONArray cleanNasaJson(JSONObject json) {

	// this was an early attempt where I parsed the date out of the
	// URL itself. Seemed fragile:

	// String selfUrl = json.getJSONObject("links").getString("self");
	// String[] urlParts = split(selfUrl, "&");
	// String date = split(urlParts[1], "=")[1];
	// JSONArray asteroids = json.getJSONObject("near_earth_objects").getJSONArray(date);

	// the keys() below come back as a Set. This is undocumented in processing.
	// so I had to check the source:
	// https://github.com/processing/processing/blob/master/core/src/processing/data/JSONObject.java
	// it's ugly, the keys are "Objects" but really Strings
	// for the "today" feed there is only one day, so I used [0] as the array index

	JSONObject neoJson = json.getJSONObject("near_earth_objects");
	String date = (String)neoJson.keys().toArray()[0];
	JSONArray asteroids = neoJson.getJSONArray(date);

	println("Number of asteroids: " + asteroids.size() );

	return asteroids;
}
