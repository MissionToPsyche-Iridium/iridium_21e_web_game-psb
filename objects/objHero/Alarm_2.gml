global.roboticsComplete = 1;

if(soundStage12Started == 0) {
	soundStage12Started = 1;
	audio_sound_gain(sndTutorial12, 0.5, 0);
	audio_play_sound(sndTutorial12, 1, false);
}

alarm[3] = 1000;