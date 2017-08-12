class Performance {
	private Scenes curScene;
	private IntroScene introScene;
	private PlayScene playScene;
	private EndScene endScene;

	Performance() {
		curScene = Scenes.INTRO;
		introScene = new IntroScene();
		playScene = new PlayScene();
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

	public void handleKey(int keyp) {
		if (keyp == ' ') {
			if (curScene == Scenes.INTRO) {
				curScene = Scenes.PLAY;
				println("Switching to Play Scene");
			}
		}
	}
}
