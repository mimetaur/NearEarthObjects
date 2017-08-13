class Performance {
	private Scenes curScene;

	private IntroScene introScene;
	private WelcomeScene welcomeScene;
	private PlayScene playScene;
	private EndScene endScene;

	private Asteroids asteroids;
	private int curAsteroidNum;
	private Asteroid curAsteroid;

	Performance(Asteroids _asteroids) {
		curAsteroidNum = (int)random(_asteroids.size());
		asteroids = _asteroids;
		curAsteroid = _asteroids.get(curAsteroidNum);

		curScene = Scenes.INTRO;
		introScene = new IntroScene();
		welcomeScene = new WelcomeScene();
		playScene = new PlayScene(curAsteroid, _asteroids.size());
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

	public void handleKey(char keyp) {
		// TODO - get the actual navigation to work
		// change asteroid number based on keypress
		switch (keyp) {
			case ' ':
				if (curScene == Scenes.INTRO) {
					curScene = Scenes.WELCOME;
					println("Switching to Welcome Scene");
				} else if (curScene == Scenes.WELCOME) {
					curScene = Scenes.PLAY;
					println("Switching to Play Scene");
				}
				break;
			case ESC:
				if (curScene == Scenes.END) {
					exit();
				} else {
					curScene = Scenes.END;
					println("Switching to End Scene");
				}
				break;
		}
	}
}
