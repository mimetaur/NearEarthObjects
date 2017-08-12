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
		text(title, width/2, height * (260.0 / 1080.0) );

		// draw C-T-A
		text(callToAction, width/2, height * (722.0 / 1080.0) );

		// draw subtitle
		fill(darkGreen);
		text(subtitle, width/2, height * (771.0 / 1080.0) );

		// draw logo
		shape(logo, width * (885.0 / width1080p), height * (361.0 / height1080p) );

	}
}
