class Performance {
	private Scenes curScene;
	private IntroScene introScene;
	private PlayScene playScene;
	private EndScene endScene;

	private Asteroids asteroids;
	private Asteroid curAsteroid;

	Performance(Asteroids _asteroids) {
		asteroids = _asteroids;
		curAsteroid = _asteroids.get(0);

		curScene = Scenes.INTRO;
		introScene = new IntroScene();
		playScene = new PlayScene(curAsteroid);
		endScene = new EndScene();
	}

	public void update() {
		switch (curScene) {
			case INTRO:
				introScene.update();
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
		switch (keyp) {
			case ' ':
				if (curScene == Scenes.INTRO) {
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
