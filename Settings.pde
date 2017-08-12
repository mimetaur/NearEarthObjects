class Settings {
	private HashMap<String,String> settings = new HashMap<String,String>();

	Settings(String filename) {
		loadFromFile(filename);
	}

	public void loadFromFile(String filename) {
		println("Loading settings from file: " + filename);
		JSONArray json = loadJSONArray(filename);
		for (int i = 0; i < json.size(); i++) {
			JSONObject jsonObj = json.getJSONObject(i);
			settings.put(jsonObj.getString("key"), jsonObj.getString("value"));
		}
		println("Loaded settings: " + settings);
	}

	public String get(String key) {
		return settings.get(key);
	}
}
