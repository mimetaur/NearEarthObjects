import java.text.MessageFormat;

class PlayScene {
	private Asteroids asteroids;
	private Asteroid currentAsteroid;

	private PShape miniLogo;
	private String asteroidNav, currentlyListening;

	// X offsets for plotting to two columns
	final private int COLUMN_1_X_OFFSET = 463;
	final private int COLUMN_2_X_OFFSET = 1081;

	PlayScene(Asteroids _asteroids) {
		asteroids = _asteroids;
		currentAsteroid = asteroids.get((int)random(asteroids.size()));

		miniLogo = loadShape("mini_logo.svg");
		currentlyListening = "CURRENTLY LISTENING";

		asteroidChanged();
	}

	private void asteroidChanged() {
		println("Current Asteroid has changed to " + currentAsteroid.name);
		currentAsteroid.outputAsOsc();
	}

	public void nextAsteroid() {
		int index = currentAsteroid.index;
		if (index == asteroids.size() - 1) {
			currentAsteroid = asteroids.get(0);
		} else {
			currentAsteroid = asteroids.get( index + 1);
		}
		asteroidChanged();
	}

	public void prevAsteroid() {
		int index = currentAsteroid.index;
		if (index == 0) {
			currentAsteroid = asteroids.get( asteroids.size() - 1 );
		} else {
			currentAsteroid = asteroids.get( index - 1);
		}
		asteroidChanged();
	}

	public void update() {
		String navTemplate = "[{0}] OF [{1}]";
		Object[] params = new Object[] { currentAsteroid.index + 1, asteroids.size() };
		asteroidNav = MessageFormat.format(navTemplate, params);
	}

	public void draw() {
		// draw logo
		shape( miniLogo, calculateXForItemAt(364), calculateYForItemAt(113) );

		// nav
		textAlign(LEFT, TOP);
		fill(brightGreen);
		textFont(medFont);
		text( asteroidNav, calculateXForItemAt(269), calculateYForItemAt(206) );

		// asteroid name
		textFont(largeFont);
		text( currentAsteroid.name.toString(), calculateXForItemAt(463), calculateYForItemAt(127) );

		// currently listening
		textFont(smallFont);
		fill(darkGreen);
		text( currentlyListening, calculateXForItemAt(463), calculateYForItemAt(96) );

		// asteroid stats

		// column 1
		plotField(currentAsteroid.diameter, 1, 283);
		plotField(currentAsteroid.isPotentiallyHazardous, 1, 426);
		plotField(currentAsteroid.relativeVelocity, 1, 569);

		// column 2
		plotField(currentAsteroid.magnitude, 2, 283);
		plotField(currentAsteroid.missDistance, 2, 426);
		plotField(currentAsteroid.orbitalEccentricity, 2, 569);
	}

	private void plotField(AsteroidDataField field, int column, int yOffset) {
		int plotX = 0;
		switch (column) {
			case 1:
				plotX = COLUMN_1_X_OFFSET;
				break;
			case 2:
				plotX = COLUMN_2_X_OFFSET;
				break;
			default:
				plotX = 0;
				break;
		}
		textFont(medFont);
		fill(brightGreen);
		text( field.getName(), calculateXForItemAt(plotX), calculateYForItemAt(yOffset) );
		fill(darkGreen);
		text( field.toString(), calculateXForItemAt(plotX), calculateYForItemAt(yOffset + MEDIUM_LINE_HEIGHT));
	}
}
