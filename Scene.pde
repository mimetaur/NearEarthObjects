class Scene {
	private Scenes curScene;

	Scene() {
		curScene = Scenes.INTRO_SCREEN;
	}

	public void handleKeyPress(char key) {
		if (curScene == Scenes.INTRO_SCREEN) {
			curScene = Scenes.PLAY;
		}
	}
}
