class Asteroid {
	private ArrayList<AsteroidDataField> asteroidDataFields;
	private AsteroidDataField<String> name;
	private AsteroidDataField<Float> magnitude;
	private AsteroidDataField<Float> diameter;
	private AsteroidDataField<Boolean> isPotentiallyHazardous;

	Asteroid(JSONObject asteroidAsJson) {
		name = addDataField("name", asteroidAsJson.getString("name"));
		magnitude = addDataField("magnitude", asteroidAsJson.getFloat("absolute_magnitude_h"), "h");

		// note - all values use kilometers when a choice is given in API
		diameter = addDataField("diameter", calculateMidpoint("estimated_diameter_min", "estimated_diameter_min", asteroidAsJson.getJSONObject("estimated_diameter").getJSONObject("kilometers")), "kph");

		isPotentiallyHazardous = addDataField("is potentially hazardous?", asteroidAsJson.getBoolean("is_potentially_hazardous_asteroid"));
		println(this);
		println(magnitude);
		println(diameter);
		println(isPotentiallyHazardous);
		println();
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




