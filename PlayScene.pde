import java.text.MessageFormat;

class PlayScene {
	private Asteroids asteroids;
	private Asteroid currentAsteroid;

	private PShape miniLogo, pauseButton, playButton;
	private String asteroidNav;
	private String currentlyListening = "CURRENTLY LISTENING TO";
	private String buttonInstructions = "Press [P] to toggle Play / Pause";

	private boolean nowPlaying = false;

	// X offsets for plotting to two columns
	final private int COLUMN_1_X_OFFSET = 463;
	final private int COLUMN_2_X_OFFSET = 1081;

	PlayScene(Asteroids _asteroids) {
		asteroids = _asteroids;
		currentAsteroid = asteroids.get((int)random(asteroids.size()));
		miniLogo = loadShape("mini_logo.svg");

		// there is some weird svg fill rule stuff going on
		// otherwise I wouldn't bother disabling styles
		// https://github.com/processing/processing/issues/3179
		pauseButton = loadShape("pause_button.svg");
		playButton = loadShape("play_button.svg");
		playButton.disableStyle();
		pauseButton.disableStyle();
		asteroidChanged();
	}

	private void asteroidChanged() {
		currentAsteroid.outputAsOsc();
	}

	public void togglePlay() {
		if (nowPlaying) {
			hitPause();
		} else {
			hitPlay();
		}
	}

	private void hitPlay() {
		nowPlaying = true;
		OscMessage playMsg = new OscMessage("/play");
		playMsg.add("1");
		println(playMsg);
		oscP5.send(playMsg, remoteLocation);
	}

	private void hitPause() {
		nowPlaying = false;
		OscMessage pauseMsg = new OscMessage("/pause");
		pauseMsg.add("1");
		oscP5.send(pauseMsg, remoteLocation);
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
		// draw buttons
		if (nowPlaying) {
			fill(brightGreen);
			shape( playButton, calculateXForItemAt(1081), calculateYForItemAt(123) );
			fill(darkGreen);
			shape( pauseButton, calculateXForItemAt(1163), calculateYForItemAt(124) );
		} else {
			fill(darkGreen);
			shape( playButton, calculateXForItemAt(1081), calculateYForItemAt(123) );
			fill(brightGreen);
			shape( pauseButton, calculateXForItemAt(1163), calculateYForItemAt(124) );
		}
		// draw instructions
		textAlign(LEFT, TOP);
		fill(darkGreen);
		textFont(smallFont);
		text( buttonInstructions, calculateXForItemAt(1267), calculateYForItemAt(145));


		// draw logo
		shape( miniLogo, calculateXForItemAt(364), calculateYForItemAt(113) );

		// nav
		textAlign(RIGHT, TOP);
		fill(brightGreen);
		textFont(medFont);
		text( asteroidNav, calculateXForItemAt(433), calculateYForItemAt(206) );

		// asteroid name
		textAlign(LEFT, TOP);
		textFont(largeFont);
		text( currentAsteroid.name.toString(), calculateXForItemAt(463), calculateYForItemAt(127) );

		// currently listening
		if (nowPlaying) {
			textFont(smallFont);
			fill(darkGreen);
			text( currentlyListening, calculateXForItemAt(463), calculateYForItemAt(96) );
		}

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
