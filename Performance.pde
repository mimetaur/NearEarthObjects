class Performance {
	private Scenes curScene;

	private IntroScene introScene;
	private WelcomeScene welcomeScene;
	private PlayScene playScene;
	private EndScene endScene;

	private Asteroids asteroids;

	Performance(Asteroids _asteroids) {
		asteroids = _asteroids;

		curScene = Scenes.INTRO;
		introScene = new IntroScene();
		welcomeScene = new WelcomeScene(asteroids.size());
		playScene = new PlayScene(asteroids);
		endScene = new EndScene();
	}

	public void update() {
		switch (curScene) {
			case INTRO:
				introScene.update();
				break;
			case WELCOME:
				welcomeScene.update();
				break;
			case PLAY:
				playScene.update();
				break;
			case END:
				endScene.update();
				break;
			default:
				endScene.update();
		}
	}

	public void draw() {
		switch (curScene) {
			case INTRO:
				introScene.draw();
				break;
			case WELCOME:
				welcomeScene.draw();
				break;
			case PLAY:
				playScene.draw();
				break;
			case END:
				endScene.draw();
				break;
			default:
				endScene.draw();
		}
	}

	public void handleKey() {
		// TODO - get the actual navigation to work
		// change asteroid number based on keypress
		if (key == ' ') {
			if (curScene == Scenes.INTRO) {
				curScene = Scenes.WELCOME;
				println("Switching to Welcome Scene");
			} else if (curScene == Scenes.WELCOME) {
				curScene = Scenes.PLAY;
				println("Switching to Play Scene");
			}
		} else if (key == ESC) {
			if (curScene == Scenes.END) {
				exit();
			} else {
				curScene = Scenes.END;
				println("Switching to End Scene");
			}
		} else if (key == CODED) {
			if (keyCode == LEFT) {
				playScene.prevAsteroid();
			} else if (keyCode == RIGHT) {
				playScene.nextAsteroid();
			}
		}
	}
}
