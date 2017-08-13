import java.text.MessageFormat;

class WelcomeScene {
	private String title, welcomeText, asteroidNavText, spacebarNavText, escNavText;
	private int asteroidsCount;
	private PShape miniLogo;

	WelcomeScene(int _asteroidsCount) {
		asteroidsCount = _asteroidsCount;
		title = "WELCOME";
		welcomeText = "Each comet and asteroid that approaches Earth tells a different story through attributes like speed, size, and orientation.\n\nSome are even potentially hazardous to our planet.\n\nThis is a chance to hear the stories generated by today’s feed of Near Earth Objects from NASA.";

		String asteroidNavTemplate = "There are {0} bodies currently present around Earth.\nYou can move through them using the arrow keys.";
		Object[] params = new Object[] { asteroidsCount };
		asteroidNavText = MessageFormat.format(asteroidNavTemplate, params);

		spacebarNavText = "PRESS SPACEBAR TO CONTINUE";
		escNavText = "OR ESC TO EXIT";

		miniLogo = loadShape("mini_logo.svg");
	}

	public void update() {
		// The Intro Scene is static
	}

	public void draw() {
		// draw logo
		shape( miniLogo, calculateXForItemAt(364), calculateYForItemAt(113) );

		// draw title
		textAlign(LEFT, TOP);
		textFont(largeFont);
		fill(brightGreen);
		text( title, calculateXForItemAt(463), calculateYForItemAt(125) );

		// draw welcomeText
		textFont(medFont);
		fill(semiDarkGreen);
		// the second two values are a second x and y (width and height)
		// to wrap text in box
		text( welcomeText, calculateXForItemAt(463), calculateYForItemAt(265), calculateXForItemAt(1108), calculateYForItemAt(343) );

		// draw asteroid nav text
		fill(brightGreen);
		text( asteroidNavText, calculateXForItemAt(463), calculateYForItemAt(677), calculateXForItemAt(1108), calculateYForItemAt(98) );

		// draw basic nav
		fill(brightGreen);
		text( spacebarNavText, calculateXForItemAt(463), calculateYForItemAt(901) );
		fill(darkGreen);
		text( escNavText, calculateXForItemAt(463), calculateYForItemAt(950) );
	}
}
