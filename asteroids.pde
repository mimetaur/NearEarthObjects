class Asteroids {
	private ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

	Asteroids(JSONArray asteroidsJson) {
		for (int i = 0; i < asteroidsJson.size(); i++) {
			Asteroid asteroid = new Asteroid(asteroidsJson.getJSONObject(i));
			asteroids.add(asteroid);
		}
	}
}
