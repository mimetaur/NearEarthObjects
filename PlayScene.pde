class PlayScene {
	private Asteroid asteroid;
	private PShape miniLogo;

	// X offsets for plotting to two columns
	final private int COLUMN_1_X_OFFSET = 463;
	final private int COLUMN_2_X_OFFSET = 1081;

	PlayScene(Asteroid _asteroid) {
		asteroid = _asteroid;
		miniLogo = loadShape("mini_logo.svg");
	}

	public void update() {

	}

	public void draw() {
		// draw logo
		shape( miniLogo, calculateXForItemAt(364), calculateYForItemAt(113) );

		// asteroid name
		textAlign(LEFT, TOP);
		fill(brightGreen);
		textFont(largeFont);
		text( asteroid.name.toString(), calculateXForItemAt(463), calculateYForItemAt(127) );

		// asteroid stats

		// column 1
		plotField(asteroid.diameter, 1, 283);
		plotField(asteroid.isPotentiallyHazardous, 1, 426);
		plotField(asteroid.relativeVelocity, 1, 569);
		plotField(asteroid.missDistance, 1, 711);

		// column 2
		plotField(asteroid.magnitude, 2, 283);
		plotField(asteroid.orbitalEccentricity, 2, 426);
		plotField(asteroid.closeApproachDate, 2, 569);
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
