class EndScene {
	private String title;
	private PShape logo;

	EndScene() {
		title = "END";
		logo = loadShape("homepage_logo.svg");
	}

	public void update() {
		// static, unused
	}

	public void draw() {
		// draw title
		textAlign(LEFT);
		textFont(largeFont);
		fill(brightGreen);
		text( title, calculateXForItemAt(824), calculateYForItemAt(521) );

		// draw logo
		shape(logo, calculateXForItemAt(947), calculateYForItemAt(434) );
	}
}
