class IntroScene {
	private String title, subtitle, callToAction, escText;
	private PShape logo;

	IntroScene() {
		title = "NEAR-EARTH OBJECTS";
		subtitle = "RETRIEVING ASTEROID AND COMET DATA FROM NASA…";
		callToAction = "PRESS SPACEBAR TO CONTINUE";
		escText = "OR ESC TO EXIT";
		logo = loadShape("homepage_logo.svg");
	}

	public void update() {
		// The Intro Scene is static
	}

	public void draw() {
		// draw title
		textAlign(CENTER);
		textFont(largeFont);
		fill(brightGreen);
		text( title, width/2, calculateYForItemAt(260) );

		// draw subtitle
		fill(darkGreen);
		textFont(medFont);
		text( subtitle, width/2, calculateYForItemAt(654) );

		// draw C-T-A
		fill(brightGreen);
		text( callToAction, width/2, calculateYForItemAt(901) );
		fill(darkGreen);
		text( escText, width/2, calculateYForItemAt(950) );

		// draw logo
		shape( logo, calculateXForItemAt(885), calculateYForItemAt(361) );
	}
}
