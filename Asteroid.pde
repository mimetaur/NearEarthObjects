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
		magnitude = addDataField("absolute magnitude", asteroidAsJson.getFloat("absolute_magnitude_h"));

		// note - all values use kilometers when a choice is given in API
		diameter = addDataField("estimated diameter", calculateMidpoint("estimated_diameter_min", "estimated_diameter_min", asteroidAsJson.getJSONObject("estimated_diameter").getJSONObject("kilometers")), "kph");

		isPotentiallyHazardous = addDataField("potentially hazardous?", asteroidAsJson.getBoolean("is_potentially_hazardous_asteroid"));

		JSONArray closeApproachData = asteroidAsJson.getJSONArray("close_approach_data");

		float relVel = closeApproachData.getJSONObject(0).getJSONObject("relative_velocity").getFloat("kilometers_per_second");
		relativeVelocity = addDataField("relative velocty", relVel, "kps");

		float missd = closeApproachData.getJSONObject(0).getJSONObject("miss_distance").getFloat("astronomical");
		missDistance = addDataField("miss distance", missd, "au");

		JSONObject orbitalData = asteroidAsJson.getJSONObject("orbital_data");
		orbitalEccentricity = addDataField("orbital eccentricity", orbitalData.getFloat("eccentricity"));

		// so each asteroid tracks its own position in the asteroids arrayList
		index = _index;
	}

	public void outputAsOsc() {
		oscP5.send(new OscMessage("did_change").add(true), remoteLocation);

		outputFieldAsOscString(name);
		outputFieldAsOscFloat(magnitude);
		outputFieldAsOscFloat(diameter);
		outputFieldAsOscBoolean(isPotentiallyHazardous);
		outputFieldAsOscFloat(relativeVelocity);
		outputFieldAsOscFloat(missDistance);
		outputFieldAsOscFloat(orbitalEccentricity);
	}

	private void outputFieldAsOscString(AsteroidDataField<String> field) {
		OscMessage msg = new OscMessage( field.oscName() );
		msg.add( field.getValue() );
		println(msg);
		oscP5.send( msg, remoteLocation );
	}

	private void outputFieldAsOscFloat(AsteroidDataField<Float> field) {
		OscMessage msg = new OscMessage( field.oscName() );
		msg.add( field.getValue() );
		println(msg);
		oscP5.send( msg, remoteLocation );
	}

	private void outputFieldAsOscBoolean(AsteroidDataField<Boolean> field) {
		OscMessage msg = new OscMessage( field.oscName() );
		msg.add( field.getValue() );
		println(msg);
		oscP5.send( msg, remoteLocation );
	}

	public String toString() {
		return name.toString();
	}

	private AsteroidDataField<String> addDataField(String name, String value) {
		AsteroidDataField newAst = new AsteroidDataField(name, value);
		return newAst;
	}

	private AsteroidDataField<Float> addDataField(String name, float value) {
		AsteroidDataField newAst = new AsteroidDataField(name, value);
		return newAst;
	}

	private AsteroidDataField<Float> addDataField(String name, float value, String units) {
		AsteroidDataField newAst = new AsteroidDataField(name, value, units);
		return newAst;
	}

	private AsteroidDataField<Boolean> addDataField(String name, boolean value) {
		AsteroidDataField newAst = new AsteroidDataField(name, value);
		return newAst;
	}

	private float calculateMidpoint(String min, String max, JSONObject json) {
		return calculateMidpoint( json.getFloat(min), json.getFloat(max) );
	}

	private float calculateMidpoint(float min, float max) {
		float sum = min + max;
		return sum / 2;
	}
}




