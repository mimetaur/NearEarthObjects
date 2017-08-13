class Asteroids {
	private ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

	Asteroids(JSONArray asteroidsJson) {
		for (int i = 0; i < asteroidsJson.size(); i++) {
			Asteroid asteroid = new Asteroid(asteroidsJson.getJSONObject(i), i);
			asteroids.add(asteroid);
		}
		println(asteroids);
	}

	Asteroid get(int index) {
		return asteroids.get(index);
	}

	int size() {
		return asteroids.size();
	}
}
