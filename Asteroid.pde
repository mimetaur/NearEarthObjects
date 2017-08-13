class Asteroid {
	public AsteroidDataField<String> name;
	public AsteroidDataField<Float> magnitude;
	public AsteroidDataField<Float> diameter;
	public AsteroidDataField<Boolean> isPotentiallyHazardous;
	public AsteroidDataField<Float> relativeVelocity;
	public AsteroidDataField<Float> missDistance;
	public AsteroidDataField<Float> orbitalEccentricity;

	public int index;

	Asteroid(JSONObject asteroidAsJson, int _index) {
		name = addDataField("name", asteroidAsJson.getString("name"));
		magnitude = addDataField("absolute magnitude (h)", asteroidAsJson.getFloat("absolute_magnitude_h"));

		// note - all values use kilometers when a choice is given in API
		diameter = addDataField("estimated diameter", calculateMidpoint("estimated_diameter_min", "estimated_diameter_min", asteroidAsJson.getJSONObject("estimated_diameter").getJSONObject("kilometers")), "kph");

		isPotentiallyHazardous = addDataField("potentially hazardous?", asteroidAsJson.getBoolean("is_potentially_hazardous_asteroid"));

		JSONArray closeApproachData = asteroidAsJson.getJSONArray("close_approach_data");

		float relVel = closeApproachData.getJSONObject(0).getJSONObject("relative_velocity").getFloat("kilometers_per_second");
		relativeVelocity = addDataField("relative velocty", relVel, "kps");

		float missd = closeApproachData.getJSONObject(0).getJSONObject("miss_distance").getFloat("kilometers");
		missDistance = addDataField("miss distance", missd, "kilometers");

		JSONObject orbitalData = asteroidAsJson.getJSONObject("orbital_data");
		orbitalEccentricity = addDataField("orbital eccentricity", orbitalData.getFloat("eccentricity"));

		index = _index;
	}

	public String toString() {
		return name.toString();
	}

	private AsteroidDataField<String> addDataField(String name, String value) {
		return new AsteroidDataField(name, value);
	}

	private AsteroidDataField<Float> addDataField(String name, float value) {
		return new AsteroidDataField(name, value);
	}

	private AsteroidDataField<Float> addDataField(String name, float value, String units) {
		return new AsteroidDataField(name, value, units);
	}

	private AsteroidDataField<Boolean> addDataField(String name, boolean value) {
		return new AsteroidDataField(name, value);
	}

	private float calculateMidpoint(String min, String max, JSONObject json) {
		return calculateMidpoint( json.getFloat(min), json.getFloat(max) );
	}

	private float calculateMidpoint(float min, float max) {
		float sum = min + max;
		return sum / 2;
	}
}




