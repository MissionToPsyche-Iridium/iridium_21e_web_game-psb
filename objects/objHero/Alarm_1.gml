// Tutorial
if(global.tutorialComplete == 0) {
	global.tutorialStage++;
	
	if(global.tutorialStage == 8) {
		if(tutorialStage9SoundStarted == 0) {
			tutorialStage9SoundStarted = 1;
			audio_sound_gain(sndTutorial9, 0.5, 0);
			audio_play_sound(sndTutorial9, 1, false);
		}
		
		alarm[1] = 700;
	}
	
	if(global.tutorialStage == 9) {
		if(tutorialStage10SoundStarted == 0) {
			tutorialStage10SoundStarted = 1;
			audio_sound_gain(sndTutorial10, 0.5, 0);
			audio_play_sound(sndTutorial10, 1, false);
		}
		
		// Unlock doors
		global.tutorialComplete = 1;
	}
}