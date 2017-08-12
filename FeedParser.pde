class FeedParser {
	private JSONObject feed;

	FeedParser(JSONObject _json) {
		feed = _json;
	}

	public JSONArray parseNasaFeedToAsteroidCollection() {
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

		JSONObject neoJson = feed.getJSONObject("near_earth_objects");
		String date = (String)neoJson.keys().toArray()[0];
		JSONArray asteroids = neoJson.getJSONArray(date);

		println("Number of asteroids in JSON feed: " + asteroids.size() );

		return asteroids;
	}
}
