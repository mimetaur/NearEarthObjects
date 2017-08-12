class IntroScene {
	private String title, subtitle, callToAction;
	private PShape logo;

	IntroScene() {
		title = "NEAR-EARTH OBJECTS";
		subtitle = "RETRIEVING ASTEROID AND COMET DATA FROM NASA…";
		callToAction = "PRESS SPACEBAR TO CONTINUE";
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
		text( subtitle, width/2, calculateYForItemAt(722) );

		// draw C-T-A
		fill(brightGreen);
		text( callToAction, width/2, calculateYForItemAt(771) );

		// draw logo
		shape(logo, width * (885.0 / WIDTH_1080P), height * (361.0 / HEIGHT_1080P) );

	}
}
